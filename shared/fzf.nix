{ pkgs, lib, nixpkgs, ... }:
{
  programs.fzf = {
    enable = true;
    enableBashIntegration = true;
  };
}
