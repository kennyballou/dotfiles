#!/bin/sh

HOOKS=${HOME}/.git_template/hooks
GWD=$(pwd)/.git/hooks

mkdir -p ${GWD}
printf "Installing hooks to: %s\n" "$GWD"

cp --dereference $HOOKS/* $GWD/.
