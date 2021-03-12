''
  [[ -n $MACOS ]] && eval "$(/opt/homebrew/bin/brew shellenv)"

  # Add cargo but favor nix binaries first.
  export PATH="$PATH:$HOME/.cargo/bin"

  export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
  export EDITOR="vim"
  if [ "{$TERM}" = "xterm-kitty" ]; then
    alias ssh='kitty +kitten ssh'
  fi
''

