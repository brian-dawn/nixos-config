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
    starship
    fzf
    git
    exa
  ]; # ++ (import ./shared/pkgs.nix pkgs);

  home.sessionVariables = {
    EDITOR = "vim";
    WSL2 = true; # TODO rename this since we need this on macos as well.
    MACOS = true; 
  };

  programs.kitty = {
    enable = true;

    # Update the kitty theme here.
    settings = import ./kitty-themes/japanesque.nix // {
      # background_opacity = "0.93";
      # font_family = "Jetbrains Mono";
      #bold_font = "FiraCode";
      #italic_font = "auto";
      #bold_italic_font = "auto";
      font_size = 13;
      enable_audio_bell = "no";
    };
  };

  programs.home-manager = {
    enable = true;
    path = "…";
  };
}
