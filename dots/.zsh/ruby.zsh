eval "$(rbenv init -)"

# temp disable rvm in favor of rbenv

# # Load RVM into a shell session *as a function*
# if [[ -s "$HOME/.rvm/scripts/rvm" ]] ; then
#  source "$HOME/.rvm/scripts/rvm"
# elif [[ -s "/usr/local/rvm/scripts/rvm" ]] ; then
#  source "/usr/local/rvm/scripts/rvm"
# fi

# `which rvm > /dev/null`
# rvm_missing=$?
# if [ "$rvm_missing" = 0 ]; then
#   rvm --default use 2.0.0-p0 &> /dev/null
# fi

# if [ -f ~/.rvm/scripts/rvm ]; then
#   source ~/.rvm/scripts/rvm
#   export PATH=$PATH:/usr/local/rvm/bin:$HOME/.rvm/bin
# elif [ -f /usr/local/rvm/scripts/rvm ]; then
#   source /usr/local/rvm/scripts/rvm
#   export PATH=$PATH:/usr/local/rvm/bin:$HOME/.rvm/bin
# fi

#alias rmv="rvm"
