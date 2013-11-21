# if we haven't already, load any keys so all apps can find them
num_keys_loaded=$(ssh-add -l | grep -v "no identities" | wc -l)
if [ $num_keys_loaded -lt 1 ]; then
  eval `ssh-agent` &> /dev/null
  ssh-add ~/.ssh/*pem &> /dev/null
  ssh-add ~/.ssh/*sa &> /dev/null
fi

