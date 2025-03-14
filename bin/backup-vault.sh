#!/bin/sh

VAULT="iCloud Obsidian"

cd "$VAULT"
find . -type f -a \( -path \.obsidian -prune -o -print \)
# does not work to exclude the .obsidian folder.
# seems to be because of shell escaping and spaces in folder names
# include the JS folder for now
cd ..

# find '${VAULT}' -path 'iCloud Obsidian/.obsidian' -prune -o -print0 | tar -cvf bak.tar --null -T -
