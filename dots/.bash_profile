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
BROWN="\[\033[0;33m\]"

function git_branch_slug() {
  clean_git_branch_name=`__git_ps1|sed -E 's/ |\(|\)//g'`
  if [ -z "$clean_git_branch_name" ]; then
    /bin/echo -n "" # don't muck up the prompt if we're not inside a git repo
  else
    /bin/echo -n "(RED${clean_git_branch_name}RESET)"
  fi
}

function git_dirty_slug() {
  dirty_status=`git status --porcelain 2> /dev/null | egrep "\sM|\sD|\?\?" &> /dev/null`
  if [ $? -eq 0 ]; then
    /bin/echo -n "BROWN ✗ RESET"
  fi
}

if [[ "$0" == *bash* ]]; then
  if [[ "$OSTYPE" == "darwin"* ]]; then
    # FIXME: os-x only; find paths for linux, etc.
    git_prompt_code="/Library/Developer/CommandLineTools/usr/share/git-core/git-prompt.sh"
    if [ -f "$git_prompt_code" ]; then
      source $git_prompt_code
      # so gross; necessary because you can't concatenate strings together to make a PS1 if any of the strings have color escapes in them... FML
      git_branch_slug_str="\$(git_branch_slug | sed 's/RED/$RED/g' | sed 's/RESET/$RESET/g')"
      git_dirty_slug_str="\$(git_dirty_slug | sed 's/BROWN/$BROWN/g' | sed 's/RESET/$RESET/g')"
      export PS1="\w$RESET $git_branch_slug_str \n\
$BOLD\h$RED ➜ ${RESET}${git_dirty_slug_str}> "
    fi
  fi
fi

export PATH=$PATH:\
/usr/local/sbin:\
/usr/local/sbin:\
/Users/$USER/bin:\
/usr/local/bin:\
/usr/bin:\
/bin:\
/usr/sbin:\
/sbin:\
/opt/X11/bin


[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

source "$HOME/.docker/init-bash.sh" || true # Added by Docker Desktop
