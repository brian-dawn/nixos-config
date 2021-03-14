{ pkgs, lib, nixpkgs, ... }:
{

  programs.zsh = {
    enable = true;
    shellAliases = import ./shell-aliases.nix;
    initExtra = ''
      [[ -n $NON_NIX_OS ]] && . $HOME/.nix-profile/etc/profile.d/nix.sh
      eval "$(starship init zsh)"

      # Make tab completion behave a bit more like bash.
      setopt autolist
      unsetopt menucomplete
    '' + builtins.readFile ./shell-extras.sh;
  };
}
