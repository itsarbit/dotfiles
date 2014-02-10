if [ -f ~/.aliases ]; then
  source ~/.aliases
fi

if [ -f ~/.exports ]; then
  source ~/.exports
fi

if [ -f ~/.functions ]; then
  source ~/.functions
fi

if [ -f ~/.paths ]; then
  source ~/.paths
fi

# set the number of open files to be 1024
ulimit -S -n 1024
complete -W "$(echo $(grep '^ssh ' ~/.bash_history | sort -u | sed 's/^ssh //'))" ssh

export GDK_NATIVE_WINDOWS=1
export TERM=xterm-256color
