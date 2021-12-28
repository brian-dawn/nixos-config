
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

