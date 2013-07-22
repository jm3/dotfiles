# screenshot:
#
# https://raw.github.com/jm3/dotfiles/master/prompt.gif

awesome_jm3_prompt() {
  arrow="%{$fg[red]%}➜"
  cwd="%{$fg[cyan]%}%B%3c%(#.#.)%b"

  git_info() {
    is_git_dirty() {
      git status --porcelain | egrep "\sM|\sD|\?\?" &> /dev/null
    }
    branch=`git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* //' `
    if [ ! -z "${branch}" ];
    then
      is_git_dirty
      if [ $? -eq 0 ];
      then
        git_filth=" %{$fg[yellow]%}✗%{$reset_color%}"
      fi
      git_branch=" (%{$fg[red]%}${branch}%{$reset_color%})"
      echo -n "${git_branch}${git_filth}"
    fi
  }

  echo -n "${arrow} ${cwd}$( git_info) > "
}

export PROMPT='$(awesome_jm3_prompt)'

