# .zsh resource file
# by john manoogian^3 <{jm3}@{jm3.net,monkey.org,umich.edu,organic.com,zivity.com,topfans.com,waroftherosesapp.com,betyourfollowers.com,bubblefusionlabs.com,140proof.com}>
# 1996-2009

# reminder of how to redirect both stdout + stderr:
# (echo your_cmd args 2>&1 > /dev/null ) > out

# enable smart renaming:
autoload zmv

autoload -U colors && colors

# for git stuff
# TODO: integrate this as per http://linuxgazette.net/184/silva.html
autoload -Uz vcs_info

# ctl-shift-x, h to show completion context
autoload -U compinit && compinit -u # rm -f ~/.zcompdump if rvm complains

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
myhosts=($h 280.$h web1.$h api1.$h neo4j1.$h graphite1.$h google.com)
compctl -k myhosts ping lynx whois ssh telnet ftp host nslookup

# complete common bundle commands
bundles=(exec install outdated package show update)
compctl -k bundles bundle

# only do directory things with directories:
compctl -g '*(/)' rmdir dircmp
compctl -g '*(-/)' cd chdir dirs pushd

# complete with active command names:
compctl -c sudo type whence where man

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
box=$(hostname | sed s/\.local// | sed s/\.dyndns\.org//)
if [ -f ~/.profile-$box ]; then
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

awesome_jm3_prompt() {
  arrow="%{$fg[red]%}➜"
  cwd="%{$fg[cyan]%}%B%3c%(#.#.)%b"

  git_info() {
    is_git_dirty() {
      git status --porcelain | egrep "\sM|\sD|\?\?" &> /dev/null
    }
    branch=`git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* //' `
    if [ ! -z "${branch}" ];
    then
      is_git_dirty
      if [ $? -eq 0 ];
      then
        git_filth=" %{$fg[yellow]%}✗%{$reset_color%}"
      fi
      git_branch=" (%{$fg[red]%}${branch}%{$reset_color%})"
      echo -n "${git_branch}${git_filth}"
    fi
  }

  echo -n "${arrow} ${cwd}$( git_info) > "
}

export PROMPT='$(awesome_jm3_prompt)'

# if we haven't already, load any keys so all apps can find them
num_keys_loaded=$(ssh-add -l | grep -v "no identities" | wc -l)
if [ $num_keys_loaded -lt 1 ]; then
  for key in $(find ~/.ssh/ -name '*sa'); do
    eval `ssh-agent` &> /dev/null && ssh-add ~/.ssh/*sa &> /dev/null
    break
  done
fi

