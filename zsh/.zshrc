autoload -U compinit promptinit -U colors && colors
compinit
promptinit
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
setopt inc_append_history
setopt share_history
setopt extended_history
setopt prompt_subst

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias sudo='sudo -E'
alias tmux='tmux -2'

prompt_char() {
    branch=`git branch 2> /dev/null | grep \* | awk '{print $2}'`
    if [ ${branch} ]; then
        gp="[%{$fg[magenta]%}${branch}"
        if [ `git status --porcelain 2> /dev/null | wc -l` -ne 0 ]; then
            gp="${gp}%{$reset_color%}(%{$fg[green]%}ϟ%{$reset_color%})"
        fi
        gp="${gp}%{$reset_color%}]±"
        echo ${gp}
        return
    fi
    echo "%%"
}
PROMPT='(@%m)(%1~)$(prompt_char) '
rprompt_precmd() {
    if [ $? -ne 0 ]; then
        RPROMPT="(%{$fg[red]%}%?%{$reset_color%})"
    else
        RPROMPT=""
    fi
}
precmd_functions+=(rprompt_precmd)