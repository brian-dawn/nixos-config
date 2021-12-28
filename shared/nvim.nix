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

      cmp-nvim-lsp
      cmp-buffer
      cmp-path
      cmp-cmdline
      nvim-cmp

      vim-commentary
      auto-pairs

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
    extraConfig = ''
      set tabstop=4
      set shiftwidth=4
      set expandtab
      syntax on

      " 24bit colors
      set termguicolors
      colorscheme gruvbox

      " Set leader to space
      nnoremap <SPACE> <Nop>
      let mapleader=" "

      " Find files using Telescope command-line sugar.
      nnoremap <leader>ff <cmd>Telescope find_files<cr>
      nnoremap <silent> <c-p> <cmd>Telescope find_files<cr>
      nnoremap <leader>fg <cmd>Telescope live_grep<cr>
      nnoremap <leader>fb <cmd>Telescope buffers<cr>
      nnoremap <leader>fh <cmd>Telescope help_tags<cr>


      set completeopt=menu,menuone,noselect
    
      lua <<EOF
        -- Setup nvim-cmp.
        local cmp = require'cmp'
      
        cmp.setup({
          snippet = {
            -- REQUIRED - you must specify a snippet engine
            expand = function(args)
              vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
              -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
              -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
              -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
            end,
          },
          mapping = {
            ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
            ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
            ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
            ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
            ['<C-e>'] = cmp.mapping({
              i = cmp.mapping.abort(),
              c = cmp.mapping.close(),
            }),
            ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
          },
          sources = cmp.config.sources({
            { name = 'nvim_lsp' },
            { name = 'vsnip' }, -- For vsnip users.
            -- { name = 'luasnip' }, -- For luasnip users.
            -- { name = 'ultisnips' }, -- For ultisnips users.
            -- { name = 'snippy' }, -- For snippy users.
          }, {
            { name = 'buffer' },
          })
        })
      
        -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
        cmp.setup.cmdline('/', {
          sources = {
            { name = 'buffer' }
          }
        })
      
        -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
        cmp.setup.cmdline(':', {
          sources = cmp.config.sources({
            { name = 'path' }
          }, {
            { name = 'cmdline' }
          })
        })
      EOF


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

      lua <<EOF
        local lsp_status = require('lsp-status')
        lsp_status.register_progress()
        
        local lspconfig = require('lspconfig')
      EOF

      function! LspStatus() abort
         if luaeval('#vim.lsp.buf_get_clients() > 0')
           return luaeval("require('lsp-status').status()")
         endif

        return ' '
      endfunction

      set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P
      set statusline+=%{LspStatus()}
        

      lua <<EOF
        require "lsp_signature".setup()
      EOF

    '';
  };
}

