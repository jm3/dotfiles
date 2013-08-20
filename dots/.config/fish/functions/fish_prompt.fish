function fish_prompt

  # darwin sed uses "-E", while ubuntu sed uses "-r"
  set -l os (uname)
  # convert full version string 1.25.6 => 1
  if [ $os = "Darwin" ]
    set major_version (echo $version | sed -E "s/([0-9])+\..*/\1/")
  else
    set major_version (echo $version | sed -r "s/([0-9])+\..*/\1/")
  end

  function _git_branch_name
    echo (git symbolic-ref HEAD ^/dev/null | sed -e 's|^refs/heads/||')
  end

  function _is_git_dirty
    echo (git status -s --ignore-submodules=dirty ^/dev/null)
  end

  set -l cyan (set_color -o cyan)
  set -l yellow (set_color -o yellow)
  set -l red (set_color -o red)
  set -l blue (set_color -o blue)
  set -l normal (set_color normal)

  set -l arrow "$red➜ "
  set -l cwd $cyan(basename (prompt_pwd))

  if [ (_git_branch_name) ]
    set -l git_branch $red(_git_branch_name)
    set git_info "$blue ($git_branch$blue)"

    if [ (_is_git_dirty) ]
      set -l dirty "$yellow ✗"
      set git_info "$git_info$dirty"
    end
  end

  # "echo -s" is a fish 2.0+ only feature
  if test $major_version -lt 2
    echo -n $arrow $cwd $git_info $normal '> '
  else
    echo -n -s $arrow $cwd $git_info $normal '> '
  end

end
