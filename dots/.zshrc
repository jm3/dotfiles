# .zsh resource file
# by john manoogian^3 <{jm3}@{jm3.net,monkey.org,umich.edu,organic.com,zivity.com,topfans.com,waroftherosesapp.com,betyourfollowers.com,bubblefusionlabs.com,140proof.com}>
# 1996-2009

# reminder of how to redirect both stdout + stderr:
# (echo your_cmd args 2>&1 > /dev/null ) > out

# reminder that aliases are defined in ~/.profile

# enable smart renaming:
autoload zmv

# source universal profile
source ~/.profile

# source git profile variables
source ~/.git-vars

source ~/.zsh/awesome-jm3-prompt.zsh
source ~/.zsh/completion.zsh
source ~/.zsh/load-host-specific-profiles.zsh
~/.zsh/load-ssh-keys.zsh
source ~/.zsh/options.zsh
source ~/.zsh/ruby.zsh
source ~/.zsh/python.zsh
# source ~/.zsh/password-gen.zsh

# keyboard commands:
bindkey -e   # use emacs keybindings
bindkey "^R" history-incremental-search-backward
bindkey "^f" forward-word
bindkey "^b" backward-word
bindkey "^w" backward-delete-word
bindkey "[3~" delete-char   # allow reverse deletes

# allow slashes to delimit words
export WORDCHARS=${WORDCHARS//\/}

# override bash-friendly alias in .profile with zsh-specific color opts
alias ls="ls -FG"

function mcdir {
  mkdir $1        
  cd $1
}

function brew_history {
  open "https://github.com/Homebrew/homebrew/commits/master/Library/Formula/$1.rb"
}
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

source "$HOME/.docker/init-zsh.sh" || true # Added by Docker Desktop

# per https://stackoverflow.com/questions/56738345/could-not-install-packages-due-to-an-environmenterror-could-not-find-a-suitable to make stable-diffusion STFU re: certs
export REQUESTS_CA_BUNDLE="$HOME/.mac-ca-roots"

test -e $HOME/.iterm2_shell_integration.zsh && source $HOME/.iterm2_shell_integration.zsh || true