# Set iTerm2 tab title (Job field) to the running command.
# Uses OSC 1 (icon title) so iTerm2's "Job — Host" template stays intact.
# Uses zsh hook arrays so this stacks with iTerm2 shell integration.

_set_title_preexec() {
  printf '\033]1;%s\007' "$1"
}

_set_title_precmd() {
  printf '\033]1;zsh\007'
}

autoload -Uz add-zsh-hook
add-zsh-hook preexec _set_title_preexec
add-zsh-hook precmd _set_title_precmd
