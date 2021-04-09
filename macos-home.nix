{ pkgs, lib, nixpkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  imports = [
    ./shared/fzf.nix
    ./shared/git.nix
    ./shared/kitty.nix
    ./shared/starship.nix
    ./shared/vim.nix
    ./shared/zsh.nix
    ./shared/emacs.nix
  ];

  programs.kitty.settings.font_size = 13;

  home.packages = with pkgs; [
    # macos specific packages here.
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
