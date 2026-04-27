# brew install pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"

# shims already in PATH via .profile; only init shell integration on first use
if [[ -d $PYENV_ROOT ]]; then
  pyenv() {
    unfunction pyenv
    eval "$(command pyenv init - zsh)"
    pyenv "$@"
  }
fi

export LDFLAGS="$LDFLAGS -L/opt/homebrew/opt/zlib/lib"
export CPPFLAGS="$CPPFLAGS -I/opt/homebrew/opt/zlib/include"

# For pkg-config to find zlib you may need to set:
export PKG_CONFIG_PATH="/opt/homebrew/opt/zlib/lib/pkgconfig"

# Add pipx/pip user installs to PATH
export PATH="$HOME/.local/bin:$PATH"

unset REQUESTS_CA_BUNDLE
