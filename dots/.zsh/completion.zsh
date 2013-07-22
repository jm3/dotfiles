# press ctl-shift-x, h when debugging to view completion "context"
autoload -U compinit && compinit -u # rm -f ~/.zcompdump if rvm complains

# complete active screens:
compctl -g "/tmp/uscreens/S-${USER}/*(p:t)" screen

# complete on hostnames:
h=140proof.com
myhosts=($h 280.$h web1.$h api1.$h neo4j1.$h graphite1.$h google.com)
compctl -k myhosts ping lynx whois ssh telnet ftp host nslookup

# complete common bundle commands
bundles=(exec install outdated package show update)
compctl -k bundles bundle

# only do directory things with directories:
compctl -g '*(/)' rmdir dircmp
compctl -g '*(-/)' cd chdir dirs pushd

# complete with active command names:
compctl -c sudo type whence where man

