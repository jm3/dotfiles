agents_running=`ps aux | grep "ssh-agen[t]" | wc -l | awk '{print $1}'`
if [ $agents_running -gt 0 ]; then
  # ok, at least one ssh-agent is running.
else
    # ssh agent not already running; start a new one
    eval `ssh-agent -s` > /dev/null
fi

keys_to_add=`find ~/.ssh -name \*pem -o -name \*sa`
for once in $keys_to_add
do
  ssh-add ~/.ssh/*pem &> /dev/null
  ssh-add ~/.ssh/*sa &> /dev/null
  return
done

