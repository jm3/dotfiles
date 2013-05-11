# .zsh resource file
# by john manoogian^3 <{jm3}@{jm3.net,monkey.org,umich.edu,organic.com,zivity.com,topfans.com,waroftherosesapp.com,betyourfollowers.com,bubblefusionlabs.com,140proof.com}>
# 1996-2009

# reminder of how to redirect both stdout + stderr:
# (echo your_cmd args 2>&1 > /dev/null ) > out

# enable smart renaming:
autoload zmv

autoload -U colors && colors

# ctl-shift-x, h to show completion context
autoload -U compinit && compinit # rm -f ~/.zcompdump if rvm complains

# keyboard commands:
bindkey -e   # use emacs keybindings
bindkey "^R" history-incremental-search-backward
bindkey "^f" forward-word
bindkey "^b" backward-word
bindkey "^w" backward-delete-word
bindkey "[3~" delete-char   # allow reverse deletes

# complete active screens:
compctl -g "/tmp/uscreens/S-${USER}/*(p:t)" screen

# complete on hostnames:
h=140proof.com
myhosts=($h 280.$h web1.$h api1.$h neo4j1.$h graphite1.$h jm3.net google.com)
compctl -k myhosts ping lynx whois ssh telnet ftp host nslookup

# complete common bundle commands
bundles=(exec install outdated package show update)
compctl -k bundles bundle

# only do directory things with directories:
compctl -g '*(/)' rmdir dircmp
compctl -g '*(-/)' cd chdir dirs pushd

# complete with active command names:
compctl -c sudo type whence where man

# build hostnames array from our ssh/config file, because we're fuckin clever:
#if [ -f ~/.ssh/config ]; then
#  hostnames=(`grep "^[Hh]ost" ~/.ssh/config | sed "s/[Hh]ost *//" | sed "s/\*//g" | xargs -n1 | sort | xargs`)
#fi

# TODO: make scp complete hostnames, but handle the : and the trailing filename

# TODO: make git complete, just as it already does with compsys, but reduce the command set down to only:
git_commands="(branch commit pull push status)"

# TODO: gem with gem_command prefix and for update, uninstall: installed_gems, and for install: server_gems
gem_commands="(build cleanup contents env install list sources tumble uninstall update)"

# these new two are are a bit slow to run on shell init,
# so leave them commented out until there's a cronjob that caches them nightly:
# installed_gems="(`gem list | awk '{print $1}' | xargs`)"
# remote_gems="(`lynx --dump http://gems.rubyforge.org/stats.html | awk '{print $1}' > ~/.remote_rubyforge_gems.txt && xargs < ~/.remote_rubyforge_gems.txt`)"

# options:
setopt AUTO_CD
setopt APPEND_HISTORY
setopt AUTO_LIST
setopt AUTO_PARAM_KEYS
setopt AUTO_PARAM_SLASH
setopt CORRECT
setopt EXTENDED_GLOB
setopt GLOB
setopt GLOB_DOTS
setopt HIST_IGNORE_DUPS
setopt LIST_AMBIGUOUS
setopt MENU_COMPLETE
setopt PROMPT_SUBST

# allow slashes to delimit words
export WORDCHARS=${WORDCHARS//\/}

# source universal profile
source ~/.profile

function mcdir {
  mkdir $1        
  cd $1
}

# source local profile
box=`hostname | sed s/\.local// | sed s/\.dyndns\.org//`
if [ -f ~/.profile-$box ]; then
  prompt="$box " # hostname + % 
  source ~/.profile-$box
else 
  if [ $(uname -s) = 'Darwin' ]; then
    echo 'hmm, looks like you got a new box (or your DNS got blown out). loading mac configs.'
    source ~/.profile-osx
  elif [ $(uname -s) = 'Linux' -a -f /etc/lsb-release -a $(grep -c Ubuntu /etc/lsb-release) -ne 0 ]
  then
    echo 'hmm, looks like you got a new box (or your DNS got blown out). loading ubuntu configs.'
    source ~/.profile-ubuntu
  fi
fi

# prompt hackery
function git_branch() {
  git symbolic-ref HEAD | cut -d'/' -f3
}
#PROMPT="${prompt}[$fg[green]\$(git_branch)$reset_color]%# "
PROMPT="${prompt}%# "

precmd () { echo -n "\033]1;$USERNAME@$HOST\033]2;$PWD> " }
parse_git_branch() {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
export PROMPT='%m %B%3c%(#.#.)%b $(parse_git_branch) > '

export RPROMPT="%@"   # right-side prompt: time only
alias right="export RPROMPT='%~ %@'"
alias noright="export RPROMPT="

# if we haven't already, load keys so all apps can find them
ps aux | grep "ssh-agen[t]" &> /dev/null
if [ $? = 1 ]; then
  ls -l ~/.ssh/*sa &> /dev/null
  if [ $? = 0 ]; then
    eval `ssh-agent` &> /dev/null && ssh-add ~/.ssh/*sa &> /dev/null
  fi
fi
