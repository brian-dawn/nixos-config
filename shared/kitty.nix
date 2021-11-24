{ pkgs, lib, nixpkgs, ... }:
{
  programs.kitty = {
    enable = true;

    # Update the kitty theme here.
    settings = import ./kitty-themes/zenburn.nix // {
      # background_opacity = "0.93";
      font_family = "FiraCode Nerd Font Mono";
      bold_font = "auto";
      italic_font = "auto";
      bold_italic_font = "auto";
      enable_audio_bell = "no";
      macos_option_as_alt = true;
    };
  };
}
