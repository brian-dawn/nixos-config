{ pkgs, lib, nixpkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  imports = [
    ./shared/starship.nix
    ./shared/bash.nix
    ./shared/fzf.nix
    ./shared/git.nix
    ./shared/vim.nix
  ];

  home.packages = with pkgs; [
    htop
    starship
    git
    fzf
    exa
    rustup

    julia
    octave
  ];

  home.sessionVariables = {
    EDITOR = "vim";
    WSL2 = true;
  };


  programs.home-manager = {
    enable = true;
    path = "…";
  };
}
