#!/bin/zsh -x
echo expanding dates...

autoload zmv
alias mmv="noglob zmv -W"

years="2007 2008 2009 2010 2011 2012 2013"
months="01 02 03 04 05 06 07 08 09 10 11 12"
for y in $years; do
  mkdir -p $months
  for m in $months; do
    echo here
    mmv "$y$m\*" "$m/$y-$m-\*"
  done
done

