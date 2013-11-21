# press ctl-shift-x, h when debugging to view completion "context"
autoload -U compinit && compinit -u # rm -f ~/.zcompdump if rvm complains

# complete active screens:
compctl -g "/tmp/uscreens/S-${USER}/*(p:t)" screen

# by default, ssh completes usernames with every user found in
# /etc/passwd, which means that when using zsh's default completion,
# ~30 useless auto-created osx user accounts appear for completion
#
# this fixes that.
zstyle ':completion:*' users $USER root ubuntu

# complete hostnames sanely.
# first, add any hostnames from our ssh/known_hosts, but exclude IP addresses
if [ -f ~/.ssh/known_hosts ]; then
  ssh_hosts=`cat ~/.ssh/known_hosts | cut -f1 -d \ | sed "s/,.*//" | egrep -v "\d+\.\d+\.\d+\.\d+" | tr '\n' ' '`
fi

# add these literal hostnames explicitly
h=140proof.com
explicit_hosts=($h 280.$h google.com)

# expand these hostname templates into foo1, foo2, foo3, etc.
expando_host_templates=(webX.$h api1.$h neo4jX.$h graphiteX.$h pubapiX.$h)
for h in $expando_host_templates; do
  echo $h | grep -q "X"
  if [ $? -eq 0 ]; then
    for n in 1 2 3; do
      x=`echo $h | sed s/X/$n/`
      expando_hosts+=($x)
    done
  fi
done

# now make 'em all available to network commands like ping, ssh, etc.
all_hosts=(`echo $ssh_hosts $explicit_hosts $expando_hosts`)
zstyle ':completion:*' hosts $all_hosts

# complete common homebrew commands
brew_cmds=(doctor info install home list update upgrade)
compctl -k brew_cmds brew

# complete common bundle operations
bundles=(exec install outdated package show update)
compctl -k bundles bundle

# only do directory things with directories:
compctl -g '*(/)' rmdir dircmp
compctl -g '*(-/)' cd chdir dirs pushd

# complete with active command names:
compctl -c sudo type whence where man

