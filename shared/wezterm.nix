{ pkgs, lib, nixpkgs, ... }:
{


  home.file = {
    ".config/wezterm" = {
      source = ./wezterm;
      recursive = true;
    };
  };

}
