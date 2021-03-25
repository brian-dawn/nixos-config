{ pkgs, lib, nixpkgs, ... }:
{

  programs.zsh = {
    enable = true;
    shellAliases = import ./shell-aliases.nix;
    initExtra = ''
      [[ -n $NON_NIX_OS ]] && . $HOME/.nix-profile/etc/profile.d/nix.sh
      eval "$(starship init zsh)"

      # Emacs style.
      bindkey -e

      # Make tab completion behave a bit more like bash.
      setopt autolist
      unsetopt menucomplete

      # Make word boundaries behave like bash for M-d and M-backspace.
      autoload -U select-word-style
      select-word-style bash
    '' + builtins.readFile ./shell-extras.sh;
  };
}
