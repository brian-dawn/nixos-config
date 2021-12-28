{ pkgs, lib, nixpkgs, ... }:
{
  programs.neovim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [

      nvim-lspconfig
      nvim-treesitter
      lsp-status-nvim

      # aurora # Color themes based on treesitter.
      gruvbox-nvim

      nvim-web-devicons
      nvim-tree-lua

      cmp-nvim-lsp
      cmp-buffer
      cmp-path
      cmp-cmdline
      nvim-cmp

      vim-commentary
      auto-pairs
      hop-nvim

      lsp_signature-nvim
      telescope-nvim

      sensible
      vim-nix
      vim-surround
      zig-vim
      rust-vim
      vim-surround
      dhall-vim
      vim-toml

      # Distraction free editing with :Goyo
      goyo-vim
      limelight-vim

    ];
    extraConfig = builtins.readFile ./nvim/init.vim +
    ''

      "
      " Activate limelight when we enter :Goyo
      " 
      autocmd! User GoyoEnter Limelight
      autocmd! User GoyoLeave Limelight!
      " Color name (:help cterm-colors) or ANSI code
      let g:limelight_conceal_ctermfg = 'gray'
      let g:limelight_conceal_ctermfg = 240
      " Color name (:help gui-colors) or RGB color
      let g:limelight_conceal_guifg = 'DarkGray'
      let g:limelight_conceal_guifg = '#777777'


      lua <<EOF
        require "lsp_signature".setup({
          hint_enable = false
        })
        
      EOF


      " Tree Mode
      lua <<EOF
        -- following options are the default
        -- each of these are documented in `:help nvim-tree.OPTION_NAME`
        require'nvim-tree'.setup({})

      EOF
    '' 
    + builtins.readFile ./nvim/hop.vim
    + builtins.readFile ./nvim/telescope.vim
    + builtins.readFile ./nvim/cmp.vim
    + builtins.readFile ./nvim/lsp.vim
    + builtins.readFile ./nvim/lsp-status.vim
    ;
  };
}

