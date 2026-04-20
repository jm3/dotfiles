# OS-level customizations
if [[ $(uname -s) = 'Darwin' ]]; then
  source ~/.profile-osx
elif [[ $(uname -s) = 'Linux' ]]; then
  source ~/.profile-ubuntu
fi

# create configs specific to your different machines by naming them
# .my_host.profile, and they'll be sourced automatically here after
# the OS-level configs, above
box=$(hostname | sed s/\.local// | sed s/\.dyndns\.org//)
if [ -f ~/.$box.profile ]; then
  source ~/.$box.profile
fi 

