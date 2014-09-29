# i highly recommend you use zsh instead of bash.
# zsh is a super-set of bash, so you'll get all the things you're
# used to in bash, but with a cherry on top. zsh has great completion
# features for tab-completing just about everything.
#
# more about zsh: http://www.zsh.org/

# if you insist on running bash, or for some reason you can't run
# zsh, you can still use all my aliases and get a cool-looking
# prompt as consolation :)

source ~/.git-vars
source ~/.profile

RED="\[\033[31m\]"
GRAY="\[\033[32m\]"
RESET="\[\033[0m\]"
BOLD="\[\033[1;36m\]"
GREEN="\[\033[0;32m\]"
XXXX="\[\033[1;33\]"

function jm3_git_ps1() {
  clean_git_branch_name=`__git_ps1|sed -E 's/ |\(|\)//g'`
  if [ -z "$clean_git_branch_name" ]; then
    /bin/echo -n "" # don't muck up the prompt if we're not inside a git repo
  else
    /bin/echo -n "(RED${clean_git_branch_name}RESET)"
  fi
}

if [[ "$0" == *bash* ]]; then
  if [[ "$OSTYPE" == "darwin"* ]]; then
    # FIXME: os-x only; find paths for linux, etc.
    git_prompt_code="/Library/Developer/CommandLineTools/usr/share/git-core/git-prompt.sh"
    if [ -f "$git_prompt_code" ]; then
      source $git_prompt_code
      export PS1="\w$RESET \$(jm3_git_ps1 | sed 's/RED/$RED/g' | sed 's/RESET/$RESET/g') \n\
$BOLD\h$RED ➜ $RESET "
    fi
  fi
fi

export PATH=$PATH:\
/usr/local/sbin:\
/usr/local/share/npm/bin:\
/usr/local/sbin:\
/Users/$USER/bin:\
/usr/local/bin:\
/usr/bin:\
/bin:\
/usr/sbin:\
/sbin:\
/opt/X11/bin

