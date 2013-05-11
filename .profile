# jm3 profile: environment variables and shell aliases for [zsh,bash]

alias ..="cd .."
alias .="clear && ls"
alias 1="l1"
alias bzip="bzip2"
alias bi="bundle install --local --path vendor"
alias c="cd"
alias cap="be cap"
alias ci="vim"
alias cut1="cut -f1 -d\ "
alias cut2="cut -f2 -d\ "
alias cut3="cut -f3 -d\ "
alias cut4="cut -f4 -d\ "
alias dc="cd"
alias deps="gem list | awk \"{print $1}\" | xargs -n1 gem dependency"
alias keys="ssh-add ~/.ssh/*sa"
alias l1="ls -1"
alias killall="killall -9 -m -v"
alias l="ls"
alias ld="ls"
alias ll="ls -lh"
alias ls="ls -F"
alias lsr="ls -R"
alias lynx="lynx -accept_all_cookies -cookie_file=$HOME/.cookies -cookie_save_file=$HOME/.cookies"
alias mmv="noglob zmv -W"
alias rmv="rvm"
alias sls="screen -ls"
alias shotgun="bundle exec shotgun -p 9292"
alias sz="source $HOME/.zshrc"
alias u="pull"
alias up="pull"
alias v="vim"
alias vf="cd"
alias vi="vim"
alias z="vim $HOME/.zshrc"

# git shortcuts
alias     d="git diff"
alias    di="git diff"
alias   dic="git diff --cached"

alias    ga="git add"
alias   gap="git add -p"

alias    gb="git branch"

alias    gc="git commit -v"
alias   gca="git commit --amend"

alias    gd="git diff --color-words"
alias   gdw="git diff --no-ext-diff --word-diff"
alias  last="git diff HEAD@{5.minutes.ago}"

alias    gf="git fetch"

alias    gp="git pull"
alias   gpr="git pull --rebase"
alias  gphm="git push heroku master"

alias   grc="git rebase --continue"
alias   gra="git rebase --abort"
alias   grs="git rebase --skip"

alias   gsl="git stash list"
alias   gss="git stash save"

alias     l="git l"
alias    lc="git log | head -n1 | awk '{print \$2}' | pbcopy"

alias     s=st
alias    st="git status"

alias    up="git up"  # pull
alias   wup="git wup" # what will be pushed

# these are set by our ~/.gitconfig
# git config --global user.name "John Manoogian III"
# git config --global user.email jm3@jm3.net

frep() {
  find=$1
  replace=$2
  usage="USAGE: frep FIND REPLACE (implicitly works on ./)"

  if [ -z "$find" ]; then echo $usage return; fi
  if [ -z "$replace" ]; then echo $usage; return; fi

  echo "replacing \"$find\" with \"$replace\", recursively"
  sleep 3
  `find . -type f \
     | grep "\.(rb\|py\|txt\|html\|txt\|md\|yml\|yaml\|cfg\|config\|js\|css\|sass\|scss)$" \
     | grep -v ".git" \
     | xargs perl -pi -e "s/$find/$replace/g"`
}

mine() {
  if [ -f "$1" ]; then
    echo $1
    git checkout --ours -- $1
  else
    echo "usage: mine FILENAME"
  fi
}

# update gems
upgems() { 
  sudo gem update
  sudo gem cleanup
}

dumpgems() {
  gem list | egrep -v "bundler|rake" | cut1 | xargs -n1 gem uninstall
}

br() {
  if [ -z $1 ]; then
    echo STDERR "Usage: $0 [branchname]"
    exit 1
  fi

  branch=$1
  git push origin origin:refs/heads/${branch}
  git fetch
  git branch --track ${branch} origin/${branch}
}

# calculate sum:
# awk '{s+=$1} END {print s}'

export EDITOR=vim
export HISTFILE=~/.command_history
export HISTSIZE=4096
export LANG=en_US.UTF-8 
export LC_ALL=en_US.UTF-8
export SAVEHIST=2048
export SVN_EDITOR=$EDITOR
export VISUAL=$EDITOR

# default OS X path:    /usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin
# default Ubuntu path:  /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
# search paths generic to ALL unices go here:
export PATH=\
$HOME/bin:\
$HOME/.rvm/bin:\
/usr/local/mysql/bin:\
/usr/local/share/npm/bin:\
/usr/local/sbin:\
/usr/local/bin:\
/usr/bin:\
/bin:

if [ -d "/usr/local/lib/node" ]; then
  export NODE_PATH="/usr/local/lib/node"
fi

if [ -f ~/.rvm/scripts/rvm ]; then
  source ~/.rvm/scripts/rvm
fi

# end general configs
