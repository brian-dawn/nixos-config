{ pkgs, lib, nixpkgs, ... }:
{

  programs.bash = {
    enable = true;
    shellAliases = {

      less = "less -R";
      ls = "exa";
      ll = "exa -l";

      gs = "git status";
      gco = "git checkout";

      # oni2-appimage="appimage-run /home/brian/Downloads/Onivim2-x86_64-master.AppImage --force-device-scale-factor 2";
      ssh-kaisa = "ssh 104.131.83.148";
      ssh-kaisa-syncthing = "echo \"visit localhost:8385\" && ssh -L 8385:localhost:8384 104.131.83.148";
      ssh-kilvin="ssh kilvin.farmvision.io";
      ssh-kvothe="ssh kilvin.farmvision.io -p 8004";
    };
    bashrcExtra = ''

      # If we are on a non-nixos OS (specifically wsl2) it seems we need this:
      [[ -n $WSL2 ]] && . $HOME/.nix-profile/etc/profile.d/nix.sh
      [[ -n $MACOS ]] && . $HOME/.nix-profile/etc/profile.d/nix.sh ; eval "$(/opt/homebrew/bin/brew shellenv)"

      # Add cargo but favor nix binaries first.
      export PATH="$PATH:$HOME/.cargo/bin"

      # Macos stuff :(
      export BASH_SILENCE_DEPRECATION_WARNING=1

      eval "$(starship init bash)"
      export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
      export EDITOR="vim"
      if [ "{$TERM}" == "xterm-kitty" ]; then
        alias ssh='kitty +kitten ssh'
      fi
    '';
  };
}
