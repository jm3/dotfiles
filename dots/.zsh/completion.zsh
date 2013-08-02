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
# by default, ssh completes hostnames found in ssh/known_hosts.
# here we add a few to that, while excluding IP addresses.
h=140proof.com
known_hosts=`cat ~/.ssh/known_hosts | cut -f1 -d \ | sed "s/,.*//" | egrep -v "\d+\.\d+\.\d+\.\d+"`
echo $known_hosts
explicit_hosts=($known_hosts $h 280.$h web1.$h api1.$h neo4j1.$h graphite1.$h google.com pubapi1.$h)
zstyle ':completion:*' hosts $known_hosts

# complete common bundle commands
bundles=(exec install outdated package show update)
compctl -k bundles bundle

# only do directory things with directories:
compctl -g '*(/)' rmdir dircmp
compctl -g '*(-/)' cd chdir dirs pushd

# complete with active command names:
compctl -c sudo type whence where man

