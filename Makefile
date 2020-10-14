NIX_FILES = $(shell find . name -name '*.nix' -type f)
MAX_AGE=14d

.PHONY: all
all: build

.PHONY: news
news:
	nix-shell --run "home-manager news"

.PHONY: build
build:
	nix-shell --run "home-manager build"

.PHONY: switch
switch:
	nix-shell --run "home-manager switch"

.PHONY: clean
clean:
	-rm -rv result
	-nix-collect-garbage --delete-older-than $(MAX_AGE)
