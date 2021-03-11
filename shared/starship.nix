{ pkgs, lib, nixpkgs, ... }:
{
  programs.starship = {
    enable = true;
    settings.character.success_symbol = "[何](bold green)";
    settings.enableZshIntegration = true;
    settings.enableBashIntegration = true;

    settings.aws.disabled = true;
    settings.gcloud.disabled = true;
  };
}
