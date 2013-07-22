# source local profiles
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

