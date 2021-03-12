{ pkgs, lib, nixpkgs, ... }:
{

  programs.bash = {
    enable = true;
    shellAliases = import ./shell-aliases.nix;
    bashrcExtra = ''

      [[ -n $NON_NIX_OS ]] && . $HOME/.nix-profile/etc/profile.d/nix.sh
        eval "$(starship init bash)"
      '' + import ./shell-extras.nix;
  };
}
