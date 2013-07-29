# i highly recommend you use zsh instead of bash.
# zsh is a super-set of bash, so you'll get all the things you're
# used to in bash, but with a cherry on top. zsh has great completion
# features for tab-completing just about everything.
#
# more about zsh: http://www.zsh.org/

# if you insist on running bash, or for some reason you can't run
# zsh, you can still use all my aliases and get a cool-looking
# prompt as consolation :)

source ~/.git-vars

source ~/.profile
if [ "$SHELL" = "/bin/bash" ]; then
  export PS1="\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ "
fi

export PATH=$PATH:$HOME/.rvm/bin:/usr/local/rvm/bin:\
/usr/local/sbin:\
/usr/local/share/npm/bin:\
/usr/local/sbin:\
/Users/jm3/bin:\
/usr/local/bin:\
/usr/bin:\
/bin:\
/usr/sbin:\
/sbin:\
/opt/X11/bin

