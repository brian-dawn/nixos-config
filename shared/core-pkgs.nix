{ pkgs, ... }:
with pkgs; [

  # Fix python libstdc++ issues.
  stdenv.cc.cc.lib
  # xonsh

  babashka

  speedtest-cli
  ipfs

  # Cloud stuff
  awscli2
  google-cloud-sdk
  httpie

  nixpkgs-fmt

  postgresql

  # Github cli tool.
  gh

  # Programming languages.
  deno
  dhall
  go
  nodejs
  rustup
  poetry

  # CLI tools.
  wget
  nmap
  entr
  exa
  git
  ripgrep
  fzf
  starship
  htop
  jq
  killall
  croc
  tealdeer
  du-dust
  unzip
  tmux
  tree
  fd # Alternative to find.
]
