{ pkgs, lib, nixpkgs, ... }:
{

  programs.zsh = {
    enable = true;
    shellAliases = import ./shell-aliases.nix;
    initExtra = ''
      [[ -n $NON_NIX_OS ]] && . $HOME/.nix-profile/etc/profile.d/nix.sh
      eval "$(starship init zsh)"
    '' + import ./shell-extras.nix;
  };
}
