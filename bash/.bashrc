#!/usr/bin/env bash

# shellcheck source=/home/kb/.profile
[[ -f ~/.profile ]] && source "${HOME}/.profile"

export HISTIGNORE="[]*:&:bg:fg:ls -l:ls -al:ls -la"
export HISTTIMEFORMAT="%Y-%m-%dT%H:%M:%S "
export HISTCONTROL=ignoreboth:erasedups
export HISTFILESIZE=200000
export HISTSIZE=200000
shopt -s histappend

alias ls='ls --color=auto'
alias grep='grep --color=auto'

if [[ "${TERM}" == "dumb" ]]; then
    alias m='cat'
    alias less='cat'
    alias more='cat'
    export PAGER=cat
    export TERM=xterm-color
    export PS1="% "
else
    export PAGER='less'
    export PS1="(\t)(\u@\h)(\W)% "
fi

if [[ -n "${INSIDE_EMACS}" ]]; then
    unset EDITOR
    unset VISUAL
else
    export EDITOR='emacsclient'
    export VISUAL='emacsclient'
fi
