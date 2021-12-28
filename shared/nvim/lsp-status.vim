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
