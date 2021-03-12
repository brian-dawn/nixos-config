{ pkgs, lib, nixpkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  imports = [
    ./shared/starship.nix
    ./shared/bash.nix
    ./shared/zsh.nix
    ./shared/fzf.nix
    ./shared/git.nix
    ./shared/vim.nix
  ];

  home.packages = with pkgs; [
    # WSL2 specific packages here.
    #  starship
    #  # bash
    #  fzf
    #  ripgrep
    #  git
    #  exa
    #  htop
  ] ++ (import ./shared/core-pkgs.nix pkgs);

  home.sessionVariables = {
    EDITOR = "vim";
    NON_NIX_OS = true; # TODO rename this since we need this on macos as well.
    MACOS = true; 
  };

  programs.kitty = {
    enable = true;

    # Update the kitty theme here.
    settings = import ./kitty-themes/japanesque.nix // {
      # background_opacity = "0.93";
      font_family = "FiraCode";
      bold_font = "auto";
      italic_font = "auto";
      bold_italic_font = "auto";
      font_size = 13;
      enable_audio_bell = "no";
      macos_option_as_alt = true;
    };
  };

  programs.home-manager = {
    enable = true;
    path = "…";
  };
}
