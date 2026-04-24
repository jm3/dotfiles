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
rm -f $HOME/.rbenv/shims/gh

source ~/.zsh/awesome-jm3-prompt.zsh
source ~/.zsh/completion.zsh
source ~/.zsh/load-host-specific-profiles.zsh
source ~/.zsh/load-ssh-keys.zsh
source ~/.zsh/options.zsh
source ~/.zsh/ruby.zsh
source ~/.zsh/python.zsh
source ~/.zsh/title.zsh # iterm 2 title integration

# keyboard commands:
bindkey -e   # use emacs keybindings
bindkey "^R" history-incremental-search-backward
bindkey "^f" forward-word
bindkey "^b" backward-word
bindkey "^w" backward-delete-word
bindkey "[3~" delete-char   # allow reverse deletes

# allow slashes to delimit words
export WORDCHARS=${WORDCHARS//\/}

# ty tim tickel
mdig() {
  local d="$1"
  if [ -z "$d" ]; then
    echo "usage: mdig domain"
    return 1
  fi

  dig +noall +answer \
    "$d" SOA \
    "$d" NS \
    "$d" TXT \
    "$d" MX \
    "$d" A \
    "$d" AAAA
}

function mcdir {
  mkdir $1
  cd $1
}

function brew_history {
  open "https://github.com/Homebrew/homebrew-core/commits/master/Formula/$1.rb"
}
# redunant, i think:
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# git friendly completion attempt
if command -v brew &>/dev/null; then
  fpath=($(brew --prefix)/share/zsh/functions $fpath)
fi
autoload -Uz _git

# Custom completion for git-friendly branch command
_branch() {
  local -a branches
  branches=(${(f)"$(git branch --format='%(refname:short)' 2>/dev/null)"})
  _describe 'branches' branches
}
compdef _branch branch

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/usr/local/bin/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/usr/local/bin/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/usr/local/bin/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/usr/local/bin/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=($HOME/.docker/completions $fpath)
autoload -Uz compinit
compinit
# End of Docker CLI completions

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# peon-ping quick controls
alias peon="bash $HOME/.claude/hooks/peon-ping/peon.sh"
[ -f $HOME/.claude/hooks/peon-ping/completions.bash ] && source $HOME/.claude/hooks/peon-ping/completions.bash

[ -f "$HOME/.iterm2_shell_integration.zsh" ] && source ~/.iterm2_shell_integration.zsh
