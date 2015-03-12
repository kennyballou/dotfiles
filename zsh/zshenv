export EDITOR='vim'

for i in $HOME/.profile.d/*.sh ; do
    if [ -r "$i" ]; then
         if [ "${-#*i}" != "$-" ]; then
            source "$i"
        else
            source "$i" >/dev/null 2>&1
        fi
    fi
done
