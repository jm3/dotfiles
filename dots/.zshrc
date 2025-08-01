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
rm -f /Users/jm3/.rbenv/shims/gh

source ~/.zsh/awesome-jm3-prompt.zsh
source ~/.zsh/completion.zsh
source ~/.zsh/load-host-specific-profiles.zsh
source ~/.zsh/load-ssh-keys.zsh
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
  open "https://github.com/Homebrew/homebrew-core/commits/master/Formula/$1.rb"
}
# redunant, i think:
# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source <(fzf --zsh)

# git friendly completion attempt
fpath=($(brew --prefix)/share/zsh/functions $fpath)
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

