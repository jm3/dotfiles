#!/bin/sh

dir="${1:-$PWD}"
echo "counting files by type in $dir"
find $dir -type f | grep -v \.git | xargs -n1 basename | rev | cut -d . -f 1 | sort | rev | uniq -c | sort -r

