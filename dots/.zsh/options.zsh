# zsh options:

# If a string isn't a command, but it is a directory name, cd to it
setopt auto_cd

# Auto-append slashes to completed directory names
setopt auto_param_slash

# Always push the current directory onto dirs stack; hop back with popd
setopt auto_pushd

# History should accrete over time; that's the nature of history
setopt append_history

# Those who repeat history are doomed to have a lot of useless history entries
setopt hist_ignore_dups

# Appends every command to the history file once it is executed
# this enables multiple shell windows to all share a common command
# history..!
setopt inc_append_history

# Reloads the history whenever you use it
setopt share_history

# When I type an ambiguous completion, show me matching options
setopt auto_list
setopt list_ambiguous

# Do "The Right Thing" when completing command options
setopt auto_param_keys

# Correct spelling of commands (set CORRECT_ALL to correct args too)
setopt correct

# When i type *.foo<tab>, expand that into the literal string of
# all matching foo while remaining in the command editor
setopt glob
setopt glob_dots

# Accept first matching completion as default
setopt menu_complete

# Sometimes its handy to be able to type: # foo bar
# so that the "foo bar" command goes into your completion history but
# doesn't run yet. (sh and bash both allow this.)
setopt interactive_comments

# Expand params, commands, and arithmetic expressions in prompt strings.
# e.g. this: export PROMPT="$(whoami) %" should correctly expand
setopt prompt_subst

# Git uses the "^" character (shift-6) to identify a specific SHA
# using "peel onion" notation; not having to quote git refspecs like
# `git rebase -i HEAD^3` is worth not being able to say rm ^topsecret*gpg
#
# https://www.kernel.org/pub/software/scm/git/docs/gitrevisions.html
unsetopt extended_glob

