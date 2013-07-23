# A collection of dotfiles.

### My setup for js / css / vim / ruby / zsh hacking, and possibly yours.

![](https://github.com/jm3/dotfiles/raw/master/prompt.gif)

### One Line Install
Paste this one liner into your terminal to install. Your existing
dotfiles will be backed up safely and your new life of unix luxury
will commence. Enjoy the jealous looks of your friends!

### `curl -L http://proof.ly/gimme-dotfiles | ruby`

### Featured Awesomeness
* Modular design; add/remove features at will. Down with 500-line config files!
* Zero gems required for operation (no rake, no thor, etc)
* Install with one line of code and you're off to the races
* Re-run `dots` at any time to retrieve recent changes + plugin updates

#### Git Awesomeness
* A preference for rebase (`autosetuprebase = always` is your friend)
* Concise log format (`git `) fits more info on screen in a legible fashion
* Git mergetool pre-configured for emacs ediff, vimdiff, and Changes.app
* Rapid-fire aliases for convenience + speed:
`ci` (check-in), `co` (check-out), `st` (status), `di` (diff),
`dic` (diff "cached", aka diff the staging area), `l` (log)
* Visually pleasing color scheme; eliminate "[angry fruit salad][salad]"

#### Vim Awesomeness
* Accidentally edit a file that needs to be edited with sudo? just hit `\s`!
* Align any code structure with [Tabular][tabular]
* Highlight syntax for [jade][jade] templates, [coffeescript][coffeescript], javascript, haml, and markdown
* To load/unload any plugin just add the plugin's url to [plugins.vim][plugins.vim] and re-run `dots`.
* Manage vim plugins with ease + grace; plugins refreshed from git no more than once weekly
* Navigate most recently used files with `:MRU`
* Pretty-print minified (or otherwise ugly) HTML + JSON with `\h` or `\j`
* Small spell-check dictionary of some common developer terms
* Save useful code snippets directly to Github Gists from Vim
* Tab-complete anything you've typed once with [Supertab][supertab]
* Three cool color schemes: *solarized*, *gummybears*, and *vividchalk*
* Options: [hidden][hidden],
[hlsearch][hlsearch],
[ignorecase][ignorecase],
[incsearch][incsearch],
[nocompatible][nocompatible],
[smartcase][smartcase],
[wildmenu][wildmenu]

#### Zsh Awesomeness
* A really great prompt: concise to save real estate, with git-awareness (branch/rebase) and git "dirty" status; no more typing git status
* Tab-complete bundler commands, screen session names, git branches, git tags, and hostnames
* Git aliases defined to shorten every common git command
* Aliases for navigation acceleration written to be back-compatible with bash
* Custom profiles loaded for each OS you use + host-name you want custom settings for. Override anything OS-level here.
* Options: [auto_cd][auto_cd],
[auto_param_keys][auto_param_keys],
[auto_pushd][auto_pushd],
[append_history][append_history],
[hist_ignore_dups][hist_ignore_dups],
[auto_list][auto_list],
[list_ambiguous][list_ambiguous],
[auto_param_keys][auto_param_keys],
[correct][correct],
[glob][glob],
[glob_dots][glob_dots],
[menu_complete][menu_complete],
[interactive_comments][interactive_comments],
[prompt_subst][prompt_subst]
* [extended_glob][extended_glob] is disabled; it confounds commands like `git reset HEAD^3`

#### Emacs Awesomeness
* Improved keybindings for navigation and buffer compilation
* If I have text selected and I start typing, replace the selection - `pending-delete-mode`
* When Emacs says "type yes", and i type "y", do what I mean - `(fset 'yes-or-no-p 'y-or-n-p)`
* Pleasing default colors + fonts

#### Mac Awesomeness
* Bonus configs + solarized color theme included for *Sublime Text 2* + *iTerm 2*

*No warranty given, express or implied. Have fun and stay safe.
Copycenter license: think xerox machine; give it to everyone. All
rights reserved, all wrongs reversed, no punches pulled.*

### Hand-crafted, updated, and carefully tuned by [@jm3](http://www.jm3.net).

[salad]: http://www.urbandictionary.com/define.php?term=angry%20fruit%20salad

[supertab]:     https://github.com/ervandew/supertab
[plugins.vim]:  https://github.com/jm3/dotfiles/blob/master/dots/.vim/plugins.vim
[tabular]:      https://github.com/godlygeek/tabular
[jade]:         http://jade-lang.com/
[coffeescript]: http://coffeescript.org/

[append_history]:       http://zsh.sourceforge.net/Doc/Release/Options.html#index-APPEND_005fHISTORY
[auto_cd]:              http://zsh.sourceforge.net/Doc/Release/Options.html#index-AUTOCD
[auto_list]:            http://zsh.sourceforge.net/Doc/Release/Options.html#index-AUTO_005fLIST
[auto_param_keys]:      http://zsh.sourceforge.net/Doc/Release/Options.html#index-AUTO_005fPARAM_005fKEYS
[auto_param_keys]:      http://zsh.sourceforge.net/Doc/Release/Options.html#index-AUTO_005fPARAM_005fSLASH
[auto_pushd]:           http://zsh.sourceforge.net/Doc/Release/Options.html#index-AUTO_005fPUSHD
[correct]:              http://zsh.sourceforge.net/Doc/Release/Options.html#index-CORRECT
[extended_glob]:        http://zsh.sourceforge.net/Doc/Release/Options.html#index-EXTENDED_005fGLOB
[glob]:                 http://zsh.sourceforge.net/Doc/Release/Options.html#index-GLOB
[glob_dots]:            http://zsh.sourceforge.net/Doc/Release/Options.html#index-GLOB_005fDOTS
[hist_ignore_dups]:     http://zsh.sourceforge.net/Doc/Release/Options.html#index-HISTIGNOREDUPS
[interactive_comments]: http://zsh.sourceforge.net/Doc/Release/Options.html#index-INTERACTIVE_005fCOMMENTS
[list_ambiguous]:       http://zsh.sourceforge.net/Doc/Release/Options.html#index-LIST_005fAMBIGUOUS
[menu_complete]:        http://zsh.sourceforge.net/Doc/Release/Options.html#index-MENUCOMPLETE
[prompt_subst]:         http://zsh.sourceforge.net/Doc/Release/Options.html#index-PROMPT_005fSUBST

[hidden]:       http://usevim.com/2012/10/19/vim101-set-hidden/
[hlsearch]:     http://vimdoc.sourceforge.net/htmldoc/options.html#'hlsearch'
[ignorecase]:   http://vimdoc.sourceforge.net/htmldoc/options.html#'ignorecase'
[incsearch]:    http://vimdoc.sourceforge.net/htmldoc/options.html#'incsearch'
[nocompatible]: http://vimdoc.sourceforge.net/htmldoc/options.html#'compatible'
[smartcase]:    http://vimdoc.sourceforge.net/htmldoc/options.html#'smartcase'
[wildmenu]:     http://vimdoc.sourceforge.net/htmldoc/options.html#'wildmenu'
