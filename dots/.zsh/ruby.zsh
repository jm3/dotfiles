`which rbenv > /dev/null`
rbenv_missing=$?
if [ "$rbenv_missing" = 0 ]; then
  export PATH=$PATH:/usr/local/var/rbenv/shims
  export RBENV_ROOT=/usr/local/var/rbenv
  eval "$(rbenv init -)"
fi


# Load RVM into a shell session *as a function*
if [[ -s "$HOME/.rvm/scripts/rvm" ]] ; then
 source "$HOME/.rvm/scripts/rvm"
  export PATH="$PATH:$HOME/.rvm/bin"
elif [[ -s "/usr/local/rvm/scripts/rvm" ]] ; then
 source "/usr/local/rvm/scripts/rvm"
fi

`which rvm > /dev/null`
rvm_missing=$?
if [ "$rvm_missing" = 0 ]; then
  rvm --default use 2.0.0-p0 &> /dev/null
fi

# current preferred version, silence output
rvm use 2.2.3 &> /dev/null

# if [ -f ~/.rvm/scripts/rvm ]; then
#   source ~/.rvm/scripts/rvm
#   export PATH=$PATH:/usr/local/rvm/bin:$HOME/.rvm/bin
# elif [ -f /usr/local/rvm/scripts/rvm ]; then
#   source /usr/local/rvm/scripts/rvm
#   export PATH=$PATH:/usr/local/rvm/bin:$HOME/.rvm/bin
# fi

#alias rmv="rvm"
