{ pkgs, lib, nixpkgs, ... }:
{
  programs.vim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [
      vim-nix
      vim-surround
      zig-vim
      rust-vim
      vim-surround
      fzf-vim
      dhall-vim
    ];
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
}
