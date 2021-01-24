{ modulesPath, lib, config, pkgs, ... }:
{
  imports = lib.optional (builtins.pathExists ./do-userdata.nix) ./do-userdata.nix ++ [
    (modulesPath + "/virtualisation/digital-ocean-config.nix")
  ];

  virtualisation.docker.enable = true;
  environment.systemPackages = with pkgs; [


    nixpkgs-fmt
    home-manager

    vim
    git

    wget
    nmap
    exa
    git
    pijul
    ripgrep
    fzf
    starship
    htop
    killall
    croc
    tealdeer
    du-dust
    unzip
    tree

    syncthing

  ];

  users.users.brian = {
    isNormalUser = true;
    description = "Brian Dawn";
    extraGroups = [ "wheel" "docker" ];
  };

  services = {
    syncthing = {
      enable = true;
      user = "brian";
      dataDir = "/home/brian/Sync";
      configDir = "/home/brian/.config/syncthing";
    };

    fail2ban = {
	enable = true;
    };
  };


  services.openssh.enable = true;
  services.openssh.passwordAuthentication = false;
  services.openssh.permitRootLogin = "no";
}
