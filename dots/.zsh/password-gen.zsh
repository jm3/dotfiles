## by jm3 (jm3.net, twitter.com/jm3) - merry xmas 2013

# add this to your ~/.bash_profile to generate secure, easy-to-remember
# passwords with the Diceware list.
#
# you'll need to open a new shell (or type source ~/.bash_profile)
# once before using genpass the first time.

# usage - just type: genpass

echo "[paranoia] defining password gen shell functions"

if [ ! -f ~/.diceware ]; then
  curl -L http://proof.ly/diceware-list > ~/.diceware
fi

# roll a pseudorandom die 5 times to create a 5 digit number
function diceroll() {
  for i in {1..5}; do echo -n $((0x$(head -c5 /dev/random|xxd -ps)%6+1)); done; echo
}

# nb. each word adds 12.9 bits of entropy; a 5-word passphrase is ~64 bits
function genpass() {
  # use the dice-roller to select five words from the list,
  # then concatenate them and remove the numbers
  (for i in {1..5}; do grep $(diceroll) ~/.diceware; done)|cut -f2 | fmt
}

echo "[paranoia] complete!"
