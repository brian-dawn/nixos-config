


[[ -n $MACOS ]] && eval "$(/opt/homebrew/bin/brew shellenv)"

unnix() {
    export PATH=$(p=$(echo $PATH | tr ":" "\n" | grep -v "/.nix-profile/" | tr "\n" ":"); echo ${p%:})
}

# Favor rust over others
#export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$PATH:$HOME/.cargo/bin"

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
