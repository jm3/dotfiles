#! /bin/sh

# use solarized for highlighting source; we install this as part of our dotfiles
style=$HOME/.source-highlight/esc-solarized.style

for source in "$@"; do
    case $source in
	*ChangeLog|*changelog) 
        source-highlight --failsafe -f esc --lang-def=changelog.lang --style-file=$style -i "$source" ;;
	*Makefile|*makefile) 
        source-highlight --failsafe -f esc --lang-def=makefile.lang --style-file=$style -i "$source" ;;
	*.tar|*.tgz|*.gz|*.bz2|*.xz)
        lesspipe "$source" ;;
        *) source-highlight --failsafe --infer-lang -f esc --style-file=$style -i "$source" ;;
    esac
done
