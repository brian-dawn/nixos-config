{ pkgs, lib, nixpkgs, ... }:

###############
# How to guide
###############
# WIFI
#   sudo nmtui

let
  oxalica-rust = fetchTarball "https://github.com/oxalica/rust-overlay/archive/master.tar.gz";
in
{
  nixpkgs.config.allowUnfree = true;

  nixpkgs.overlays = [
    (import (builtins.fetchTarball {
      url = https://github.com/nix-community/neovim-nightly-overlay/archive/master.tar.gz;
    }))

    (import oxalica-rust)
  ];

  imports = [
    ./shared/bash.nix
    ./shared/fzf.nix
    ./shared/git.nix
    ./shared/kitty.nix
    ./shared/starship.nix
    ./shared/vim.nix
    ./shared/nvim.nix
    ./shared/waybar.nix
    ./shared/qutebrowser.nix
    #  ./shared/emacs.nix
  ];

  home.packages = with pkgs; [
    # Extra packages here.
    brillo
    qutebrowser
    swaybg
    wofi
    mpd
    pavucontrol
    font-awesome # Needed for waybar icons.

    (rust-bin.stable.latest.default)
    cargo-watch
    clang

    pyright
    python310
  ];

  home.sessionVariables = {
    EDITOR = "vim";
    GLFW_IM_MODULE = "ibus";
  };

  #  services.syncthing = {
  #    enable = true;
  #  };

  # programs.emacs = {
  #   enable = true;
  #   extraPackages = epkgs: [
  #     epkgs.nix-mode
  #     epkgs.magit
  #     epkgs.lsp-mode
  #     epkgs.paredit
  #     epkgs.rainbow-delimiters
  #     epkgs.smex

  #     epkgs.cider
  #     epkgs.clojure-mode

  #   ];
  # };

  programs.kitty.settings.font_size = 9;


  # programs.vscode = {
  #   enable = true;
  #   package = pkgs.vscode;
  #   userSettings = {
  #     "editor.fontFamily" = "Jetbrains Mono";
  #   };
  #   extensions = with pkgs.vscode-extensions; [
  #     vscodevim.vim
  #     ms-vsliveshare.vsliveshare

  #     dhall.dhall-lang
  #     ms-vscode.cpptools
  #     bbenoist.Nix
  #     justusadam.language-haskell
  #     matklad.rust-analyzer
  #     ms-python.python

  #     # Themes
  #     mskelton.one-dark-theme
  #     #matklad.pale-fire
  #     #nopjmp.fairyfloss
  #     #jaredkent.laserwave
  #   ];
  # };

  #   programs.firefox = {
  #     enable = true;
  #     profiles = {
  #       myprofile = {
  #         userChrome = ''
  #     TabsToolbar .tabbrowser-tab { margin-top: 8px !important; ) 
  #               '';
  #         # settings = {
  #         #   "general.smoothScroll" = true;
  #         # };
  #       };
  #     };
  #   };

  gtk = {
    enable = true;
    iconTheme = {
      name = "Adwaita-dark";
      package = pkgs.gnome3.adwaita-icon-theme;
    };
    theme = {
      name = "Adwaita-dark";
      package = pkgs.gnome3.gnome_themes_standard;
    };
  };


  wayland.windowManager.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
    config = {
      bars = [ ];
      modifier = "Mod4";
      terminal = "kitty";
      menu = "wofi --show=drun";
      startup = [
        { command = "waybar"; }
        { command = "mako"; }
        { command = "swaybg -i ~/wallpaper.jpeg -m fill"; }
      ];
    };
    extraConfig = ''

hide_edge_borders smart

smart_gaps on
gaps inner 8

input "type:keyboard" {
  xkb_options ctrl:nocaps
}

input type:touchpad {
    tap enabled
    natural_scroll enabled
}

bindsym XF86MonBrightnessUp exec brillo -A 10 -q
bindsym XF86MonBrightnessDown exec brillo -U 10 -q

bindsym XF86AudioRaiseVolume exec "pactl set-sink-volume 0 +5%"
bindsym XF86AudioLowerVolume exec "pactl set-sink-volume 0 -5%"
bindsym XF86AudioMute exec "pactl set-sink-mute 0 toggle"

client.focused #555555 #555555 #ffffff #2e9ef4 #555555


      '';



  };

  programs.mako = {
    enable = true;


    backgroundColor = "#1d2021";
    textColor = "#ebdbb2";

    borderSize = 2;
    borderColor = "#83a598";
  };

  #    gtk.enable = true; gtk.theme.name = "Numix"; gtk.iconTheme.name = "Numix";
  #    gtk.gtk3.bookmarks = [
  #      "file:///home/brian/Sync"
  #    ];

  #    dconf = {
  #      enable = true;
  #      settings = {
  #        "org/gnome/desktop/interface" = {
  #          enable-hot-corners = false;
  #          # gtk-key-theme = "Emacs";
  #          gtk-key-theme = "Default";
  #        };
  #        "org/gnome/desktop/input-sources" = {
  #          mru-sources = [ (lib.hm.gvariant.mkTuple [ "xkb" "us" ]) (lib.hm.gvariant.mkTuple [ "ibus" "mozc-jp" ]) ];
  #          sources = [ (lib.hm.gvariant.mkTuple [ "xkb" "us" ]) (lib.hm.gvariant.mkTuple [ "ibus" "mozc-jp" ]) ];
  #          per-window = false;

  #        };
  #        "org/gnome/shell".enabled-extensions = [
  #          pkgs.gnomeExtensions.appindicator.uuid
  #          pkgs.gnomeExtensions.caffeine.uuid
  #        ];
  #      };
  #    };


  programs.home-manager = {
    enable = true;
    path = "…";
  };
}
