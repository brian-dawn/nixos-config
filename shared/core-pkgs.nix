{ pkgs, ... }:
with pkgs; [

  nodePackages.prettier
  # Language server stuff
  nodePackages.pyright
  nodePackages.typescript-language-server
  rust-analyzer
  gopls

  # Fix python libstdc++ issues.
  stdenv.cc.cc.lib
  # xonsh
  neofetch

  # julia

  gdb
  # lldb

  # babashka

  # speedtest-cli
  ipfs

  # Cloud stuff
  awscli2
  # google-cloud-sdk
  httpie

  # nixpkgs-fmt

  postgresql

  # Github cli tool.
  # gh

  # Programming languages.
  deno
  #dhall
  go
  #nim
  #nimlsp
  nodejs
  rustup
  poetry

  # CLI tools.
  wget
  nmap
  # entr
  # exa
  git
  ripgrep
  fzf
  starship
  htop
  # jq
  killall
  croc
  tealdeer
  du-dust
  unzip
  tmux
  tree
  fd # Alternative to find.
]
