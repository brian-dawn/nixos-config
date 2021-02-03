{ pkgs, lib, nixpkgs, ... }:
{

  programs.bash = {
    enable = true;
    shellAliases = {
      ls = "exa";

      gs = "git status";
      gco = "git checkout";

      ssh-kaisa = "ssh 104.131.83.148";
      ssh-kaisa-syncthing = "echo \"visit localhost:8385\" && ssh -L 8385:localhost:8384 104.131.83.148";
    };
    bashrcExtra = ''
      eval "$(starship init bash)"
      export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
      export EDITOR="vim"
      if [ "{$TERM}" == "xterm-kitty" ]; then
        alias ssh='kitty +kitten ssh'
      fi
    '';
  };
}