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

