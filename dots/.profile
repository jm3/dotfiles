# jm3 profile: environment variables and shell aliases for [zsh,bash]

alias ..="cd .."
alias .="clear && ls"
alias 1="l1"
alias bi="bundle install --local --path vendor"
alias bzip="bzip2"
alias c="cd"
alias cap="be cap"
alias ci="vim"
alias cut1="cut -f1 -d\ "
alias cut2="cut -f2 -d\ "
alias cut3="cut -f3 -d\ "
alias cut4="cut -f4 -d\ "
alias cut5="cut -f5 -d\ "
alias cut6="cut -f6 -d\ "
alias dc="cd"
alias dd="cd /Volumes/Travel/`date +%Y`"
alias deps="gem list | awk \"{print $1}\" | xargs -n1 gem dependency"
alias keys="ssh-add ~/.ssh/*pem ~/.ssh/*sa"
alias ip="ifconfig | grep inet | grep -v inet6"
alias killall="killall -9 -m -v"
alias l1="ls -1"
alias l="ls"
alias ld="ls"
alias ll="ls -lh"
alias ls="ls -F"
alias lsr="ls -R"
alias lynx="lynx -accept_all_cookies -cookie_file=$HOME/.cookies -cookie_save_file=$HOME/.cookies"
alias mmv="noglob zmv -W"
alias shotgun="bundle exec shotgun -p 9292"
alias sls="screen -ls"
alias sz="source $HOME/.zshrc"
alias u="pull"
alias up="pull"
alias v="vim"
alias vf="cd"
alias vi="vim"
alias z="vim $HOME/.zshrc"

# git shortcuts
alias   sha="git log | head -n1 | awk '{print \$2}'"
alias    di="git diff"
alias   dic="git diff --cached"
alias   diw="git diw"

alias  recent="git diff HEAD@{5.minutes.ago}"

alias  gphm="git push heroku master"

alias   gra="git rebase --abort"
alias   grc="git rebase --continue"
alias   grs="git rebase --skip"

alias   gsl="git stash list"
alias   gss="git stash save"

alias     s=st
alias    st="git status"

alias    up="git up"  # pull
alias   wup="git wup" # what will be pushed

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

function tweet {
  twurl -q -d "status=$1" /1/statuses/update.xml
}

# update gems
upgems() { 
  sudo gem update
  sudo gem cleanup
}

dumpgems() {
  gem list | egrep -v "bundler|rake" | cut1 | xargs -n1 gem uninstall
}

turl(){
  curl --socks5-hostname localhost:9050 $@ ;
}
alias check="turl -s https://check.torproject.org/ | egrep \"Sorry|Congratulations\""

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

export EDITOR=vim
export HISTSIZE=4096
export LANG=en_US.UTF-8 
export LC_ALL=en_US.UTF-8
export SAVEHIST=2048
export SVN_EDITOR=$EDITOR
export VISUAL=$EDITOR
export WWW_HOME=http://duckduckgo.com

if [ "$SHELL" = "/bin/zsh" -o "$SHELL" = "/usr/local/bin/zsh" ]; then
  export HISTFILE=$HOME/.zsh/history.zsh
fi

# default OS X path:    /usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin
# default Ubuntu path:  /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
# search paths generic to ALL unices go here:
export PATH=\
$HOME/bin:\
$HOME/bin/unversioned:\
/usr/local/bin:\
/usr/local/heroku/bin:\
/usr/local/mysql/bin:\
/usr/local/sbin:\
/usr/local/share/npm/bin:\
/usr/bin:\
/bin:\
/usr/sbin:\
/sbin

if [ -d "/usr/local/lib/node" ]; then
  export NODE_PATH="/usr/local/lib/node"
fi

if [ -f "$HOME/profile.local" ]; then
  source $HOME/profile.local
fi

# end general configs

if [ -d ~/Checkouts ]; then
  cd ~/Checkouts
fi

