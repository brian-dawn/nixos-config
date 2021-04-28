{ pkgs, lib, nixpkgs, ... }:
{
  programs.starship = {
    enable = true;
    settings.character.success_symbol = "[何](bold green)";

    settings.aws.disabled = true;
    settings.gcloud.disabled = true;
  };
}
