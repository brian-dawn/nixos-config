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

  fonts.fonts = with pkgs; [
    jetbrains-mono
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    liberation_ttf

    # Japanese fonts.
    ipafont
    kochi-substitute

    mplus-outline-fonts
    dina-font
    proggyfonts
    (nerdfonts.override {
      fonts = [
        "FiraCode"
        "DroidSansMono"
        "SourceCodePro"
        "Inconsolata"
      ];
    })
  ];

  fonts.fontconfig.defaultFonts = {
    monospace = [
      "FiraCode"
      #"IPAGothic"
    ];
    sansSerif = [
      "DejaVu Sans"
      #"IPAPGothic"
    ];
    serif = [
      "DejaVu Serif"
      #"IPAPMincho"
    ];
  };

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
  services.xserver.displayManager.gdm.wayland = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome3.enable = true;

  # Configure keymap in X11
  services.xserver.layout = "us";
  services.xserver.xkbOptions = "ctrl:nocaps";
  services.xserver.libinput.naturalScrolling = false;

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable syncthing.
  services = {
    syncthing = {
      enable = true;
      user = "brian";
      dataDir = "/home/brian/Sync";
      configDir = "/home/brian/.config/syncthing";
    };
  };

  # Enable sound.
  # sound.enable = true;
  # hardware.pulseaudio.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.brian = {
    isNormalUser = true;
    description = "Brian Dawn";
    extraGroups = [ "wheel" "docker" ];
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages =
    let

      myPythonPackages = pythonPackages: with pythonPackages; [
        numpy
        pandas
        #scikitlearn
        matplotlib
        pytorch
        ipython
      ];
    in
    with pkgs; [

      # Nix stuff.
      nixpkgs-fmt
      home-manager

      # Gnome stuff.
      numix-gtk-theme
      numix-icon-theme
      numix-icon-theme-circle
      gnomeExtensions.appindicator
      #gnomeExtensions.no-title-bar
      gnomeExtensions.caffeine

      sway
      xorg.xeyes

      appimage-run

      # Cloud stuff
      awscli2
      google-cloud-sdk

      # Games
      dwarf-fortress

      # 3D printing
      openscad
      blender
      prusa-slicer

      # Media tools.
      vlc
      ffmpeg

      # Editors
      vim
      emacs
      kakoune

      # Helpful CLI tools.
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

      # Sandboxing & Virtualization stuff.
      docker
      firecracker

      # Document generation.
      pandoc
      mdbook
      zola
      hugo

      syncthing

      # IDEs
      vscode
      jetbrains.clion
      jetbrains.idea-community
      android-studio

      # Browsers.
      firefox
      brave

      # Terminal emulators
      kitty
      alacritty

      # Misc libs/tools
      librealsense
      openssl.dev
      openssl
      pkgconfig
      llvmPackages.bintools


      # Python
      (python3.withPackages myPythonPackages)

      # Rust
      rustc
      cargo
      rustfmt
      rustPackages.clippy

      # Other programming languages.
      gcc
      clang
      julia
      octave
      nodejs
      deno
      go
      idris2
      zig
      dhall
      ghc
      futhark
      clojure
      babashka
      janet
      crystal
      elixir
      #pypy3

      # Communication.
      slack
      discord
      signal-desktop

    ];

  services.udev.packages = with pkgs; [ gnome3.gnome-settings-daemon ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

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
