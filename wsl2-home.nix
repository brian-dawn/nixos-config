{ pkgs, lib, nixpkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  nixpkgs.overlays = [
    (import (builtins.fetchTarball {
      url = https://github.com/nix-community/neovim-nightly-overlay/archive/master.tar.gz;
    }))
  ];

  imports = [
    ./shared/bash.nix
    ./shared/fzf.nix
    ./shared/git.nix
    ./shared/starship.nix
    ./shared/vim.nix
    ./shared/emacs.nix
  ];

  # We want the non-gui emacs version.
  programs.emacs.package = pkgs.emacs-nox;

  home.packages = with pkgs; [
    # WSL2 specific packages here.
  ] ++ (import ./shared/pkgs.nix pkgs);

  home.sessionVariables = {
    EDITOR = "vim";
    NON_NIX_OS = true;
  };


  programs.home-manager = {
    enable = true;
    path = "…";
  };
}
