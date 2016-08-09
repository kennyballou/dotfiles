#!/bin/sh

HOOKS=${HOME}/.git_template/hooks
GWD=$(pwd)/.git/hooks

printf "Installing hooks to: %s\n" "$GWD"

cp --dereference $HOOKS/* $GWD/.
