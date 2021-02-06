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

  home.packages = [
    pkgs.htop
    pkgs.fortune
    pkgs.starship
    pkgs.git
    pkgs.fzf
    pkgs.exa
  ];

  home.sessionVariables = {
    EDITOR = "vim";
  };


  programs.home-manager = {
    enable = true;
    path = "…";
  };
}
