{ pkgs, lib, nixpkgs, ... }:
{
  programs.neovim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [

      nvim-lspconfig
      nvim-compe

      sensible
      vim-nix
      vim-surround
      zig-vim
      rust-vim
      vim-surround
      fzf-vim
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

      " Open files in horizontal split
      nnoremap <silent> <c-p> :call fzf#run({
      \   'down': '40%',
      \   'sink': 'botright split' })<CR>
    '';
  };
}
