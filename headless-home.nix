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

  programs.vim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [ vim-surround
                                      zig-vim
                                      rust-vim
                                      vim-surround
                                      fzf-vim ];
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

      ssh-kaisa = "ssh 104.131.83.148";
      ssh-kaisa-syncthing = "echo \"visit localhost:8385\" && ssh -L 8385:localhost:8384 104.131.83.148";
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

  programs.home-manager = {
    enable = true;
    path = "…";
  };
}
