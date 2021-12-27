{ pkgs, lib, nixpkgs, ... }:
{
  programs.neovim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [

      nvim-lspconfig
      nvim-compe
      nvim-treesitter

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
    extraConfig = ''
      set tabstop=4
      set shiftwidth=4
      set expandtab
      syntax on

      " Set leader to space
      nnoremap <SPACE> <Nop>
      let mapleader=" "

      " Find files using Telescope command-line sugar.
      nnoremap <leader>ff <cmd>Telescope find_files<cr>
      nnoremap <silent> <c-p> <cmd>Telescope find_files<cr>
      nnoremap <leader>fg <cmd>Telescope live_grep<cr>
      nnoremap <leader>fb <cmd>Telescope buffers<cr>
      nnoremap <leader>fh <cmd>Telescope help_tags<cr>

      " Turn on autocomplete
      set completeopt=menuone,noselect

      let g:compe = {}
      let g:compe.enabled = v:true
      let g:compe.autocomplete = v:true
      let g:compe.debug = v:false
      let g:compe.min_length = 1
      let g:compe.preselect = 'enable'
      let g:compe.throttle_time = 80
      let g:compe.source_timeout = 200
      let g:compe.incomplete_delay = 400
      let g:compe.max_abbr_width = 100
      let g:compe.max_kind_width = 100
      let g:compe.max_menu_width = 100
      let g:compe.documentation = v:true
      
      let g:compe.source = {}
      let g:compe.source.path = v:true
      let g:compe.source.buffer = v:true
      let g:compe.source.calc = v:true
      let g:compe.source.nvim_lsp = v:true
      let g:compe.source.nvim_lua = v:true
      let g:compe.source.vsnip = v:true
      let g:compe.source.ultisnips = v:true

      " LSP 
      lua << EOF
        require'lspconfig'.pyright.setup{}
        require'lspconfig'.rust_analyzer.setup({})
        require'lspconfig'.tsserver.setup({})
        require'lspconfig'.gopls.setup {
          cmd = {"gopls", "serve"},
          settings = {
            gopls = {
              analyses = {
                unusedparams = true,
              },
              staticcheck = true,
            },
          },
        }
      EOF

      " Treesitter
      " Enable tree sitter syntax highlighting.
      lua <<EOF
      require'nvim-treesitter.configs'.setup {
        highlight = {
          enable = true,
          custom_captures = {
            -- Highlight the @foo.bar capture group with the "Identifier" highlight group.
            ["foo.bar"] = "Identifier",
          },
        },
      }
      EOF
      " Add tree sitter selections of ast nodes
      lua <<EOF
      require'nvim-treesitter.configs'.setup {
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "gnn",
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm",
          },
        },
      }
      EOF
      " Tree sitter based indentation
      lua <<EOF
      require'nvim-treesitter.configs'.setup {
        indent = {
          enable = true
        }
      }
      EOF

      " Treesitter based folding
      set foldmethod=expr
      set foldexpr=nvim_treesitter#foldexpr()

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


    '';
  };
}

