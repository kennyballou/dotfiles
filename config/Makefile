STOW_OPTIONS:=--dotfiles --no-folding --ignore=.nix --ignore=.stowit
STOW_TARGETS:=$(shell find . -iname '.stowit')
UNSTOW_TARGETS:=$(patsubst %/.stowit,%/.unstowit,$(STOW_TARGETS))
.PHONY: all
all: stow

.PHONY: stow
stow: emacs/.stowit \
      envvars/.stowit

.PHONY: unstow
unstow: emacs/.unstowit \
        envvars/.unstowit

.PHONY: $(STOW_TARGETS)
$(STOW_TARGETS):
	stow $(STOW_OPTIONS) --target=$$HOME --restow $(dir $@)

.PHONY: $(UNSTOW_TARGETS)
$(UNSTOW_TARGETS):
	stow $(STOW_OPTIONS) --target=$$HOME --delete $(dir $@)
