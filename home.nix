{ pkgs, lib, nixpkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  nixpkgs.overlays = [
    (import (builtins.fetchTarball {
      url = https://github.com/nix-community/neovim-nightly-overlay/archive/master.tar.gz;
    }))
  ];

  imports = [
    ./shared/bash.nix
    ./shared/fzf.nix
    ./shared/git.nix
    ./shared/kitty.nix
    ./shared/starship.nix
    ./shared/vim.nix
    ./shared/nvim.nix
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

  programs.firefox = {
    enable = true;
    profiles = {
      myprofile = {
        userChrome = ''
    TabsToolbar .tabbrowser-tab { margin-top: 8px !important; ) 
              '';
        # settings = {
        #   "general.smoothScroll" = true;
        # };
      };
    };
  };

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


  programs.waybar = {

    enable = true;

    settings = [{
            layer = "top";
            position = "top";
            height = 24;

            modules-left = ["sway/workspaces" "sway/mode"];
            modules-right = ["network" "battery" "clock" "tray"];
          }
          ];

  };

  wayland.windowManager.sway = {
    enable = true;
    wrapperFeatures.gtk = true ;
    config = {
      bars = [];
      modifier="Mod4";
      terminal="kitty";
      menu="wofi --show=drun";
      startup= [
        { command = "waybar"; }
        { command = "mako"; }
        { command = "swaybg -i ~/wallpaper.jpeg -m fill"; }
      ];
    };
    extraConfig = ''
input "type:keyboard" {
  xkb_options ctrl:nocaps
}

bindsym XF86MonBrightnessUp exec brillo -A 10 -q
bindsym XF86MonBrightnessDown exec brillo -U 10 -q
      '';



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
  }; }
