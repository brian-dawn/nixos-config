{ pkgs, lib, nixpkgs, ... }:

let
  oxalica-rust = fetchTarball "https://github.com/oxalica/rust-overlay/archive/master.tar.gz";
in
{
  nixpkgs.config.allowUnfree = true;

  nixpkgs.overlays = [
    (import (builtins.fetchTarball {
      url = https://github.com/nix-community/neovim-nightly-overlay/archive/master.tar.gz;
    }))
    (import oxalica-rust)
  ];

  imports = [
    ./shared/bash.nix
    ./shared/fzf.nix
    ./shared/git.nix
    ./shared/starship.nix
    ./shared/vim.nix
    ./shared/nvim.nix
    ./shared/emacs.nix
  ];

  # We want the non-gui emacs version.
  programs.emacs.package = pkgs.emacs-nox;

  home.packages = with pkgs; [
    # WSL2 specific packages here.
    (rust-bin.stable.latest.default)
    # (rust-bin.selectLatestNightlyWith (toolchain:
    #     toolchain.default.override {
    #       extensions = [ "rust-analyzer" "rust-src" "rustfmt" ];
    # }))
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
