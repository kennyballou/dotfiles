NIX_FILES = $(shell find . name -name '*.nix' -type f)
MAX_AGE=14d
CHANNEL_FILE=./config/guix/channels.scm
HOSTS=h4x daeva owl baal yak koi bard
SYSTEMS=$(patsubst %,systems/%,$(HOSTS))
HOMES=$(patsubst %,homes/%,$(HOSTS))
HOSTNAME=$(shell hostname)
NPROC=$(shell nproc)
CORES=$(guile (max 1 (floor (/ $(NPROC) 4))))
LOAD_PATH=--load-path=./


.PHONY: current-system
current-system: config/emacs/emacs.d/init.el homes/$(HOSTNAME) systems/$(HOSTNAME)

.PHONY: list
list:
	@LC_ALL=C $(MAKE) -pRrq -f $(lastword $(MAKEFILE_LIST)) : 2>/dev/null | awk -v RS= -F: '/^# File/,/^# Finished Make data base/ {if ($$1 !~ "^[#.]") {print $$1}}' | sort | egrep -v -e '^[^[:alnum:]]' -e '^$@$$'

.PHONY: pull
pull:
	guix time-machine -C $(CHANNEL_FILE) -- pull

.PHONY: news
news:
	guix time-machine -C $(CHANNEL_FILE) -- pull --news

.PHONY: update-channels
update-channels:
	guix pull --channels=$(CHANNEL_FILE)
	guix describe --format=channels > $(CHANNEL_FILE)

.PHONY: reconfigure-home
reconfigure-home:
	guix time-machine -C $(CHANNEL_FILE) -- home $(LOAD_PATH) reconfigure $(RECONFIGURE_FLAGS) homes/$(HOSTNAME).scm

.PHONY: rollback-home
	guix time-machine -C $(CHANNEL_FILE) -- home $(LOAD_PATH) roll-back homes/$(HOSTNAME).scm

.PHONY: reconfigure-system
reconfigure-system:
	sudo -E guix time-machine -C $(CHANNEL_FILE) -- system $(LOAD_PATH) reconfigure $(RECONFIGURE_FLAGS) systems/$(HOSTNAME).scm

.PHONY: rollback-system
rollback-system:
	sudo -E guix time-machine -C $(CHANNEL_FILE) -- system $(LOAD_PATH) roll-back systems/$(HOSTNAME).scm

.PHONY: lint
lint:
	guix lint $(LOAD_PATH) ./

.PHONY: refresh
refresh:
	guix time-machine -C $(CHANNEL_FILE) -- refresh

.PHONY: clean
clean:
	-rm -rv result
	-nix-collect-garbage --delete-older-than $(MAX_AGE)

.PHONY: repl
repl:
	guix time-machine -C $(CHANNEL_FILE) -- repl $(LOAD_PATH)

.PHONY: all-systems
all-systems: $(SYSTEMS)

.PHONY: all-homes
all-homes: $(HOMES)

$(HOMES):
	guix time-machine -C $(CHANNEL_FILE) -- home build $(LOAD_PATH) --cores=$(CORES) $@.scm

.PHONY: $(SYSTEMS)
$(SYSTEMS):
	guix time-machine -C $(CHANNEL_FILE) -- system $(LOAD_PATH) build --cores=$(CORES) $@.scm

## Private targets
config/emacs/emacs.d/init.el config/emacs/emacs.d/early-init.el: config/emacs/emacs.d/emacs.org
	emacs -Q --batch --eval "(progn (require 'ob-tangle) (dolist (file command-line-args-left) (with-current-buffer (find-file-noselect file) (org-babel-tangle))))" "$<"
