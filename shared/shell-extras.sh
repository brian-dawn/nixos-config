


[[ -n $MACOS ]] && eval "$(/opt/homebrew/bin/brew shellenv)"


# Favor rust over others
export PATH="$HOME/.cargo/bin:$PATH"

# Favor using choosenim instead of nix packaged stuff.
export PATH="$HOME/.nimble/bin:$PATH"

# Disable C-s locking the shell.
if [[ -t 0 && $- = *i* ]]
then
    stty -ixon
fi 

export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
export EDITOR="vim"
if [ "{$TERM}" = "xterm-kitty" ]; then
  alias ssh='kitty +kitten ssh'
fi
