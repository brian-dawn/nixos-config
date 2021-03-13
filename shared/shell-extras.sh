[[ -n $MACOS ]] && eval "$(/opt/homebrew/bin/brew shellenv)"

# Favor rust over others
export PATH="$HOME/.cargo/bin:$PATH"

export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
export EDITOR="vim"
if [ "{$TERM}" = "xterm-kitty" ]; then
  alias ssh='kitty +kitten ssh'
fi
