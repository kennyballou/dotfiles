if [ "$TERM" = "dumb" ]; then
    export PAGER='cat'
else
    export PAGER='less'
fi

if [ -n "INSIDE_EMACS" ]; then
    unset EDITOR
else
    export EDITOR='emacs'
fi

eval $(dircolors "$HOME/.config/DIR_COLORS")

for i in $HOME/.profile.d/*.sh ; do
    if [ -r "$i" ]; then
         if [ "${-#*i}" != "$-" ]; then
            source "$i"
        else
            source "$i" >/dev/null 2>&1
        fi
    fi
done
unset i
