{ pkgs, lib, nixpkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  imports = [
    ./shared/bash.nix
    ./shared/fzf.nix
    ./shared/git.nix
    ./shared/starship.nix
    ./shared/vim.nix
  ];

  home.packages = with pkgs; [
    # Extra packages here.
  ] ++ (import ./shared/pkgs.nix pkgs);

  home.sessionVariables = {
    EDITOR = "vim";
    GLFW_IM_MODULE = "ibus";
  };

  programs.kitty = {
    enable = true;

    # Update the kitty theme here.
    settings = import ./kitty-themes/japanesque.nix // {
      # background_opacity = "0.93";
      font_family = "Jetbrains Mono";
      #bold_font = "FiraCode";
      #italic_font = "auto";
      #bold_italic_font = "auto";
      font_size = 9;
      enable_audio_bell = "no";
    };
  };

  services.syncthing = {
    enable = true;
  };

  programs.emacs = {
    enable = true;
    extraPackages = epkgs: [
      epkgs.nix-mode
      epkgs.magit
      epkgs.lsp-mode
      epkgs.paredit
      epkgs.rainbow-delimiters
      epkgs.smex

      epkgs.cider
      epkgs.clojure-mode

    ];
  };

  programs.vscode = {
    enable = true;
    package = pkgs.vscode;
    userSettings = {
      "editor.fontFamily" = "Jetbrains Mono";
    };
    extensions = with pkgs.vscode-extensions; [
      vscodevim.vim
      ms-vsliveshare.vsliveshare

      dhall.dhall-lang
      ms-vscode.cpptools
      bbenoist.Nix
      justusadam.language-haskell
      matklad.rust-analyzer
      ms-python.python

      # Themes
      mskelton.one-dark-theme
      #matklad.pale-fire
      #nopjmp.fairyfloss
      #jaredkent.laserwave
    ];
  };

  programs.firefox = {
    enable = true;
    profiles = {
      myprofile = {
        settings = {
          "general.smoothScroll" = true;
        };
      };
    };
  };

  gtk.enable = true;
  gtk.theme.name = "Numix";
  gtk.iconTheme.name = "Numix";
  gtk.gtk3.bookmarks = [
    "file:///home/brian/Sync"
  ];

  dconf = {
    enable = true;
    settings = {
      "org/gnome/desktop/interface" = {
        enable-hot-corners = false;
        # gtk-key-theme = "Emacs";
        gtk-key-theme = "Default";
      };
      "org/gnome/desktop/input-sources" = {
        mru-sources = [ (lib.hm.gvariant.mkTuple [ "xkb" "us" ]) (lib.hm.gvariant.mkTuple [ "ibus" "mozc-jp" ]) ];
        sources = [ (lib.hm.gvariant.mkTuple [ "xkb" "us" ]) (lib.hm.gvariant.mkTuple [ "ibus" "mozc-jp" ]) ];
        per-window = false;

      };
      "org/gnome/shell".enabled-extensions = [
        pkgs.gnomeExtensions.appindicator.uuid
        pkgs.gnomeExtensions.caffeine.uuid
      ];
    };
  };


  programs.home-manager = {
    enable = true;
    path = "…";
  };
}
