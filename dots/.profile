# jm3 profile: environment variables and shell aliases for [zsh,bash]

alias ..="cd .."
alias .="clear && ls"
alias 1="l1"
alias a="alias"
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
alias dc="docker-compose"
alias dd="cd ~/travel/`date +%Y`"
alias deps="gem list | awk \"{print $1}\" | xargs -n1 gem dependency"
alias docker-ip='docker inspect --format "{{ .NetworkSettings.IPAddress }}" $(docker ps -q)'
alias dots-dev="cd ~/.dotfiles/dots"
alias frank="gshuf -n 1 ~/.frank | tr '[:lower:]' '[:upper:]'" # gshuf is part of the gnu coreutils pkg : brew install coreutils
alias ip="ifconfig | grep inet | grep -v inet6"
alias json="python -m json.tool"
alias killall="killall -9 -m -v"
alias ks="ls -FG"
alias l1="ls -1"
alias l="ls"
alias ld="ls"
alias ll="ls -oh"
alias ls="ls -FG"
alias lsr="ls -R"
alias lynx="lynx -accept_all_cookies -cookie_file=$HOME/.cookies -cookie_save_file=$HOME/.cookies"
alias mmv="noglob zmv -W"
alias more="less"
alias mvim="open -a MacVim.app"
alias nr="npm run"
alias p="vim $HOME/.profile"
alias rubyweb="ruby -run -ehttpd . -p9292"
alias shotgun="bundle exec shotgun -p 9292"
alias sls="screen -ls"
alias sz="source $HOME/.zshrc"
alias u="pull"
alias up="pull"
alias v="vim"
alias vf="cd"
alias vi="vim"
alias web="rubyweb"
alias x="cd ~/xfer/"
alias z="vim $HOME/.zshrc"

if type "safe-rm" &> /dev/null; then
  alias rm="safe-rm"
fi

# git shortcuts
alias s="st"
alias di="git diff"
alias ga="git add"
alias st="git status"
alias up="git up"  # pull
alias dic="git diff --cached"
alias diw="git diw"
alias gra="git rebase --abort"
alias grc="git rebase --continue"
alias grs="git rebase --skip"
alias sha="git log | head -n1 | awk '{print \$2}'"
alias wup="git wup" # what will be pushed
alias gphm="git push heroku master"
alias recent="git diff HEAD@{5.minutes.ago}"

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

function keys {
  source ~/.zsh/load-ssh-keys.zsh
}

function tweet {
  twurl -q -d "status=$1" /1/statuses/update.xml
}

# update gems
upgems() { 
  gem update
  gem cleanup
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

export DEFAULT_HOME=$HOME/Code
export EDITOR=vim
export HISTSIZE=4096
export LANG=en_US.UTF-8 
export LC_ALL=en_US.UTF-8
export SAVEHIST=2048
export SVN_EDITOR=$EDITOR
export VISUAL=$EDITOR
export WWW_HOME=http://duckduckgo.com
export HOMEBREW_CASK_OPTS="--caskroom=/usr/local/Caskroom"

# requires https://www.gnu.org/software/src-highlite/;
# {apt-get | brew} install source-highlight
if type "source-highlight" &> /dev/null; then
  LESSPIPE=`which src-hilite-lesspipe.sh`
  export LESSOPEN="| ${LESSPIPE} %s"
  export LESS=' -R -X -F '
fi

if [ "$SHELL" = "/bin/zsh" -o "$SHELL" = "/usr/local/bin/zsh" ];
then
  export HISTFILE=$HOME/.zsh/history.zsh
fi

export GOPATH=$HOME/Code/go/

# default OS X path:    /usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin
# default Ubuntu path:  /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
# search paths generic to ALL unices go here:
export PATH=\
$HOME/bin:\
$HOME/bin/dropbox:\
$HOME/Code/go/bin:\
$HOME/.rvm/bin:\
$HOME/Code/go/bin:\
/opt/java/Home/bin:\
/usr/local/bin:\
/usr/local/heroku/bin:\
/usr/local/ec2/bin:\
/usr/local/mysql/bin:\
/usr/local/sbin:\
/usr/local/share/npm/bin:\
/usr/bin:\
/bin:\
/usr/sbin:\
/sbin:\
./bin

export GOPATH=$HOME/Code/go

if [ -d "/usr/local/lib/node" ]; then
  export NODE_PATH="/usr/local/lib/node"
fi

if [ -f "$HOME/profile.local" ]; then
  source $HOME/profile.local
fi

# end general configs

if [ $PWD = $HOME ]; then
  if [ -d $DEFAULT_HOME ]; then
    cd $DEFAULT_HOME
  fi
fi


# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
