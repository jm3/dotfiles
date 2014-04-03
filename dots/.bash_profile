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
  # good colors: 31m, 32m, 34m, 35m, 36m
  PS1="\[\033[31m\]➜\[\033[01;34m\] \w \$([[ \$? != 0 ]] && echo \"\[\033[01;31m\]:(\[\033[01;34m\] \")>\[\033[00m\] "
fi

export PATH=$PATH:\
/usr/local/sbin:\
/usr/local/share/npm/bin:\
/usr/local/sbin:\
/Users/$USER/bin:\
/usr/local/bin:\
/usr/bin:\
/bin:\
/usr/sbin:\
/sbin:\
/opt/X11/bin

