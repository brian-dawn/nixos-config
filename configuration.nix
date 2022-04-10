# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [
      ./local.nix
      /etc/nixos/hardware-configuration.nix
    ];

  nixpkgs.config.allowUnfree = true;
  programs.dconf.enable = true;
  virtualisation.docker.enable = true;

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # networking.hostName = "pantalaimon"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Set your time zone.
  time.timeZone = "America/Chicago";

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking.useDHCP = false;
  networking.interfaces.enp0s25.useDHCP = true;
  networking.interfaces.wlp4s0.useDHCP = true;
  networking.firewall.enable = false;

  fonts.fonts = with pkgs; [
    jetbrains-mono
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    liberation_ttf

    # Japanese fonts.
    ipafont
    kochi-substitute

    # mplus-outline-fonts
    # dina-font
    # fira-code
    # proggyfonts
    (nerdfonts.override {
      fonts = [
        "FiraCode"
        # "DroidSansMono"
        # "SourceCodePro"
        # "Inconsolata"
      ];
    })
  ];

  #    fonts.fontconfig.defaultFonts = {
  #      monospace = [
  #        "FiraCode"
  #        #"IPAGothic"
  #      ];
  #      sansSerif = [
  #        "DejaVu Sans"
  #        #"IPAPGothic"
  #      ];
  #      serif = [
  #        "DejaVu Serif"
  #        #"IPAPMincho"
  #      ];
  #    };

  i18n.inputMethod = {
    enabled = "ibus";
    ibus.engines = with pkgs.ibus-engines; [ anthy mozc ];
  };

  nix = {
    package = pkgs.nixFlakes;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  # i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  # };

  # Enable the GNOME 3 Desktop Environment.
  services.xserver.enable = true;
  # services.xserver.displayManager.gdm.wayland = true;
  # services.xserver.displayManager.lightdm.enable = true;
  #services.xserver.desktopManager.gnome.enable = true;
  # services.xserver.desktopManager.mate.enable = true;
  # services.xserver.desktopManager.xfce.enable = true;

  services.xserver.displayManager.defaultSession = "sway";
  services.xserver.displayManager.lightdm.enable = true;
  services.xserver.libinput.enable = true;

  # Configure keymap in X11
  services.xserver.layout = "us";
  services.xserver.xkbOptions = "ctrl:nocaps";
  services.xserver.libinput.touchpad.naturalScrolling = false;

  # Enable CUPS to print documents.
  services.printing.enable = true;


  xdg.portal.enable = true;
  services.flatpak.enable = true;

  # Enable syncthing.
  services = {
    syncthing = {
      enable = true;
      user = "brian";
      dataDir = "/home/brian/Sync";
      configDir = "/home/brian/.config/syncthing";
    };

    ipfs = {
      enable = true;
    };

    tlp = {
      enable = true;
    };
  };

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;


  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.brian = {
    isNormalUser = true;
    description = "Brian Dawn";
    extraGroups = [ "video" "wheel" "docker" "audio" ];
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages =
    with pkgs; [

      home-manager
      #networkmanager

      # Gnome stuff.
      #  numix-gtk-theme
      #  numix-icon-theme
      #  numix-icon-theme-circle
      #  gnomeExtensions.appindicator
      #  #gnomeExtensions.no-title-bar
      #  gnomeExtensions.caffeine

      #  obs-studio
      # sway
      #  xorg.xeyes
      alsa-lib
      libxkbcommon
      pavucontrol
      pkgconfig
      udev
      wayland
      wayland-scanner


      motion

      #appimage-run

      #  qemu
      #  qemu-utils

      # Games
      #  dwarf-fortress

      # 3D printing
      #  openscad
      #  blender
      #  prusa-slicer
      #  cura

      # Media tools.
      vlc

      # Sandboxing & Virtualization stuff.
      docker
      #  firecracker

      syncthing

      # IDEs
      # vscode
      # jetbrains.clion
      # jetbrains.idea-community
      # android-studio

      # Browsers.
      firefox-wayland
      # brave

      # Terminal emulators
      kitty
      alacritty

      # networkmanager
      # Misc libs/tools
      #   librealsense
      #   openssl.dev
      #   openssl
      #   pkgconfig
      #   llvmPackages.bintools

      # Rust
      # rustc
      # cargo
      # rustfmt
      # rustPackages.clippy


      # Communication.
      #   slack
      #   discord
      #   signal-desktop
      wl-clipboard
      brightnessctl

    ] ++ (import ./shared/pkgs.nix pkgs);

  # Exclude a bunch of garbage.
  environment.gnome.excludePackages = [ pkgs.gnome.cheese pkgs.gnome-photos pkgs.gnome.gnome-music pkgs.gnome.gnome-terminal pkgs.gnome.gedit pkgs.epiphany pkgs.evince pkgs.gnome.gnome-characters pkgs.gnome.totem pkgs.gnome.tali pkgs.gnome.iagno pkgs.gnome.hitori pkgs.gnome.atomix pkgs.gnome-tour ];

  # services.udev.packages = with pkgs; [ gnome3.gnome-settings-daemon ];


  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };
  # networking.wireless.enable = true;
  networking.networkmanager.enable = true;
  # List services that you want to enable:
  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true; # so that gtk works properly
    extraPackages = with pkgs; [
      swaylock-effects
      swayidle
      wl-clipboard
      kanshi # auto randr
      mako # notification daemon
      alacritty # Alacritty is the default terminal in the config
    ];
  };

  # or
  programs.light.enable = true;

  services.localtime.enable = true;

  location.latitude = 44.986656;
  location.longitude = -93.258133;
  location.provider = "manual";
  # services.redshift = {
  #   enable = false;
  #   temperature.day = 5500;
  #   temperature.night = 3700;
  #   package = pkgs.redshift-wlr; # Wayland
  # };

  services.geoclue2.enable = true;
  services.geoclue2.appConfig.redshift = {
    isAllowed = true;
    isSystem = true;
  };

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;
  services.openssh.passwordAuthentication = false;
  services.openssh.permitRootLogin = "no";

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "20.09"; # Did you read the comment?

}
