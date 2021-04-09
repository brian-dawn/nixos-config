{ pkgs, lib, nixpkgs, ... }:
{


  home.file = {
    ".emacs.d" = {
      source = ./emacs.d;
      recursive = true;
    };
  };
  
  programs.emacs = {
    enable = true;

    extraPackages = epkgs: [ epkgs.emms epkgs.magit epkgs.focus epkgs.smex];

  };
}
