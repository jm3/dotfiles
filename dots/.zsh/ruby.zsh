# To enable auto-switching of Rubies specified by .ruby-version files,
# uncomment some combination of the following.
# Note that chruby auto-switching is disabled if you use rbenv; you only need one of them enabled.

# source /usr/local/share/chruby/chruby.sh
# source /opt/homebrew/opt/chruby/share/chruby/chruby.sh
# source /opt/homebrew/opt/chruby/share/chruby/auto.sh

# chruby 3.0.2

# Added by `rbenv init` (2024)
# currently in rbenv mode
# eval "$(rbenv init - zsh)"
#
# supposedly faster
# Skip rehashing (faster startup, manual `rbenv rehash` needed after installing gems)
eval "$(rbenv init - --no-rehash zsh)"
