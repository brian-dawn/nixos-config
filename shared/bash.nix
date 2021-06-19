{ pkgs, lib, nixpkgs, ... }:
{

  programs.bash = {
    enable = true;
    shellAliases = import ./shell-aliases.nix;
    profileExtra = ''
      if [ -e $HOME/.nix-profile/etc/profile.d/nix.sh ]; then . $HOME/.nix-profile/etc/profile.d/nix.sh; fi
      export BASH_SILENCE_DEPRECATION_WARNING=1
    '';
    bashrcExtra = ''

      [[ -n $NON_NIX_OS ]] && . $HOME/.nix-profile/etc/profile.d/nix.sh
      eval "$(starship init bash)"
    '' + builtins.readFile ./shell-extras.sh;
  };
}
