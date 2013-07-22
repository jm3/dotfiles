# if we haven't already, load any keys so all apps can find them
num_keys_loaded=$(ssh-add -l | grep -v "no identities" | wc -l)
if [ $num_keys_loaded -lt 1 ]; then
  for key in $(find ~/.ssh/ -name '*sa'); do
    eval `ssh-agent` &> /dev/null && ssh-add ~/.ssh/*sa &> /dev/null
    break
  done
fi

