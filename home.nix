{ pkgs, lib, nixpkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  home.packages = [
    pkgs.htop
    pkgs.fortune
  ];

  home.sessionVariables = {
    EDITOR = "vim";
    GLFW_IM_MODULE = "ibus";
  };

  programs.kitty = {
    enable = true;

    settings = {
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

  programs.vim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [ vim-surround fzf-vim ];
    settings = { };
    extraConfig = ''
      set tabstop=4
      set shiftwidth=4
      set expandtab
      syntax on
      " Open files in horizontal split
      nnoremap <silent> <c-p> :call fzf#run({
      \   'down': '40%',
      \   'sink': 'botright split' })<CR>
    '';
  };

  programs.starship = {
    enable = true;
    settings.character.success_symbol = "[何](bold green)";
  };

  programs.fzf = {
    enable = true;
    enableBashIntegration = true;
  };

  programs.bash = {
    enable = true;
    shellAliases = {
      ls = "exa";

      gs = "git status";
      gco = "git checkout";

      ssh-joestar = "ssh 67.205.137.3";
      ssh-joestar-syncthing = "echo \"visit localhost:8385\" && ssh -L 8385:localhost:8384 67.205.137.3";
    };
    bashrcExtra = ''
      eval "$(starship init bash)"
      export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
    '';
  };

  programs.git = {
    enable = true;
    userName = "Brian Dawn";
    userEmail = "brian.t.dawn@gmail.com";
    extraConfig = {
      init = {
        defaultBranch = "main";
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
        gtk-key-theme = "Emacs";
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
