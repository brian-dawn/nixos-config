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
