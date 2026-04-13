# brew install pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv &>/dev/null; then
  eval "$(pyenv init - zsh)"
fi

export LDFLAGS="$LDFLAGS -L/opt/homebrew/opt/zlib/lib"
export CPPFLAGS="$CPPFLAGS -I/opt/homebrew/opt/zlib/include"

# For pkg-config to find zlib you may need to set:
export PKG_CONFIG_PATH="/opt/homebrew/opt/zlib/lib/pkgconfig"

# Add pipx/pip user installs to PATH
export PATH="$HOME/.local/bin:$PATH"

unset REQUESTS_CA_BUNDLE
