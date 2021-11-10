{ pkgs, lib, nixpkgs, ... }:
{
  programs.git = {
    enable = true;
    userName = "Brian Dawn";
    userEmail = "brian.t.dawn@gmail.com";
    extraConfig = {
      global = {
        rerere = true;
      };
      init = {
        defaultBranch = "main";
      };
      pull = {
        rebase = true;
      };
    };
  };

}
