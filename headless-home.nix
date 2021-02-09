{ pkgs, lib, nixpkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  imports = [
    ./shared/bash.nix
    ./shared/fzf.nix
    ./shared/git.nix
    ./shared/starship.nix
    ./shared/vim.nix
  ];

  home.packages = with pkgs; [
    # Extra packages here.
  ];

  home.sessionVariables = {
    EDITOR = "vim";
    GLFW_IM_MODULE = "ibus";
  };


  services.syncthing = {
    enable = true;
  };

  programs.home-manager = {
    enable = true;
    path = "…";
  };
}
