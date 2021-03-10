{ pkgs, lib, nixpkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  imports = [
    ./shared/starship.nix
    ./shared/bash.nix
    ./shared/fzf.nix
    ./shared/git.nix
    # ./shared/vim.nix
  ];

  home.packages = with pkgs; [
    # WSL2 specific packages here.
    neovim
    starship
    fzf
    git
    exa
  ]; # ++ (import ./shared/pkgs.nix pkgs);

  home.sessionVariables = {
    EDITOR = "vim";
    WSL2 = true; # TODO rename this since we need this on macos as well.
  };


  programs.home-manager = {
    enable = true;
    path = "…";
  };
}
