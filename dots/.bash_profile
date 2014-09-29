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

if [[ "$0" == *bash* ]]; then
  PS1="bash_profile_crashed_while_setting_prompt (\w) "

  red='\[\e[31m\]'
  green='\[\e[32m\]'
  cyan='\[\e[1;34m\]'
  reset_color='\[\e[0m\]'

  function is_git_dirty() {
    git status --porcelain | egrep "\sM|\sD|\?\?" &> /dev/null
  }

  function awesome_jm3_prompt {
    arrow="$red ➜"
    cwd="$cyan\w$reset_color"

    function git_info() {
      is_git_dirty() {
        git status --porcelain | egrep "\sM|\sD|\?\?" &> /dev/null
      }
      branch=`git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* //' `
      if [ ! -z "${branch}" ];
      then
        is_git_dirty
        if [ $? -eq 0 ];
        then
          git_filth=" $green ✗ $reset_color"
        fi
        git_branch=" ($red${branch}$reset_color)"
        echo -n "${git_branch}${git_filth}"
      fi
    }

    echo -n "${arrow} ${cwd}$( git_info)> "
  }

  export PS1="$(awesome_jm3_prompt) $ "
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

