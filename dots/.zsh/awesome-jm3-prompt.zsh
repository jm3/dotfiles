# screenshot of the finished product:
#
# https://raw.github.com/jm3/dotfiles/master/prompt.gif

# enable logically named ANSI color escape sequences in prompts
autoload -U colors && colors

awesome_jm3_prompt() {
  if [ "$TERM" = "dumb" ]; then
    echo -n "# > "
  else
    arrow="%{$fg[red]%}➜"
    cwd="%{$fg[cyan]%}%B%3c%(#.#.)%b"

    git_info() {
      # Only check git status if we're in a git repo
      git rev-parse --is-inside-work-tree &>/dev/null || return

      branch=$(git symbolic-ref --short HEAD 2>/dev/null || git rev-parse --short HEAD 2>/dev/null)
      if [ -n "${branch}" ]; then
        # Quick check for dirty status
        if ! git diff-index --quiet HEAD -- 2>/dev/null; then
          git_filth=" %{$fg[yellow]%}✗%{$reset_color%}"
        fi
        git_branch=" (%{$fg[red]%}${branch}%{$reset_color%})"
        echo -n "${git_branch}${git_filth}"
      fi
    }

    echo -n "${arrow} ${cwd}$( git_info) > "
  fi
}

export PROMPT='$(awesome_jm3_prompt)'
