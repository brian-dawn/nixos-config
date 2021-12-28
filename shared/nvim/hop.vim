" Enable easymotion
lua <<EOF
  require'hop'.setup()
EOF
nnoremap <leader>w <cmd>HopWord<cr>
nnoremap <leader>k <cmd>HopLineBC<cr>
nnoremap <leader>j <cmd>HopLineAC<cr>
