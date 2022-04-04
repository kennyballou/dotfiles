NIX_FILES = $(shell find . name -name '*.nix' -type f)
MAX_AGE=14d
CHANNEL_FILE=./config/guix/channels.scm
HOSTS=h4x daeva eligos baal yak
SYSTEMS=$(patsubst %,systems/%,$(HOSTS))
HOMES=$(patsubst %,homes/%,$(HOSTS))
HOSTNAME=$(shell hostname)

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

.PHONY: reconfigure-home
reconfigure-home:
	guix time-machine -C $(CHANNEL_FILE) -- home reconfigure homes/$(HOSTNAME).scm

.PHONY: rollback-home
	guix time-machine -C $(CHANNEL_FILE) -- home roll-back homes/$(HOSTNAME).scm

.PHONY: reconfigure-system
reconfigure-system:
	sudo -E guix time-machine -C $(CHANNEL_FILE) -- system reconfigure systems/$(HOSTNAME).scm

.PHONY: rollback-system
rollback-system:
	sudo -E guix time-machine -C $(CHANNEL_FILE) -- system roll-back systems/$(HOSTNAME).scm

.PHONY: lint
lint:
	guix lint --load-path=./ ./

.PHONY: refresh
refresh:
	guix time-machine -C $(CHANNEL_FILE) -- refresh

.PHONY: clean
clean:
	-rm -rv result
	-nix-collect-garbage --delete-older-than $(MAX_AGE)

.PHONY: all-systems
all-systems: $(SYSTEMS)

.PHONY: all-homes
all-homes: $(HOMES)

$(HOMES):
	guix time-machine -C $(CHANNEL_FILE) -- home build --cores=2 $@.scm

.PHONY: $(SYSTEMS)
$(SYSTEMS):
	guix time-machine -C $(CHANNEL_FILE) -- system build --cores=2 $@.scm

## Private targets
config/emacs/emacs.d/init.el config/emacs/emacs.d/early-init.el: config/emacs/emacs.d/emacs.org
	emacs -Q --batch --eval "(progn (require 'ob-tangle) (dolist (file command-line-args-left) (with-current-buffer (find-file-noselect file) (org-babel-tangle))))" "$<"
