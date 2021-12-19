{ pkgs, lib, nixpkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  nixpkgs.overlays = [
    (import (builtins.fetchTarball {
      url = https://github.com/nix-community/neovim-nightly-overlay/archive/master.tar.gz;
    }))
    (self: super: {
      kitty = pkgs.runCommandLocal "no-kitty" { } "mkdir $out";
      # kitty = pkgs.kitty.overrideAttrs (old: { NIX_CFLAGS_COMPILE = "-Wno-error -Wno-deprecated-declarations -Wnodeprecated-declarations"; });
    })

  ];



  imports = [
    ./shared/fzf.nix
    ./shared/git.nix
    ./shared/kitty.nix
    ./shared/starship.nix
    ./shared/vim.nix
    # ./shared/nvim.nix
    ./shared/bash.nix
    # ./shared/emacs.nix
  ];

  # programs.kitty.package = (pkgs.kitty) (old: { NIX_CFLAGS_COMPILE = "-Wno-error"; });
  #nixpkgs.kitty = pkgs.kitty.overrideAttrs (old: { NIX_CFLAGS_COMPILE = "-Wno-error"; });
  #programs.kitty.settings.font_size = 13;

  home.packages = with pkgs; [
    # macos specific packages here.
    #neovim-nightly
  ] ++ (import ./shared/core-pkgs.nix pkgs);

  home.sessionVariables = {
    EDITOR = "vim";
    NON_NIX_OS = true;
    MACOS = true;
  };

  programs.home-manager = {
    enable = true;
    path = "…";
  };
}
