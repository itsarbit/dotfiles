source ~/.aliases
source ~/.exports
source ~/.paths
source ~/.functions

# set the number of open files to be 1024
ulimit -S -n 1024
complete -W "$(echo $(grep '^ssh ' ~/.bash_history | sort -u | sed 's/^ssh //'))" ssh


export GDK_NATIVE_WINDOWS=1

# [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*



