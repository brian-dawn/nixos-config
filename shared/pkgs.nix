# NOTE: this file is imported both by home.nix and configuration.nix.
{ pkgs, ... }:
let

  myPythonPackages = pythonPackages: with pythonPackages; [
    ec2instanceconnectcli

    numpy
    pandas
    #scikitlearn
    matplotlib
    pytorch
    ipython
  ];
in
with pkgs; [

  # Cloud stuff
  awscli2
  google-cloud-sdk

  ffmpeg
  nixpkgs-fmt

  # Editors
  # vim
  emacs
  kakoune
  neovim

  # Python
  (python3.withPackages myPythonPackages)

  postgresql

  # Programming languages.
  # babashka
  clang
  clangStdenv
  # clojure
  crystal
  deno
  dhall
  elixir
  # futhark
  # gcc
  gccStdenv
  ghc
  go
  idris2
  janet
  julia
  nodejs
  octave
  zig
  rustup
  poetry

  jdk11
  ktlint

  # CLI tools.
  wget
  nmap
  exa
  git
  pijul
  ripgrep
  fzf
  starship
  htop
  killall
  croc
  tealdeer
  du-dust
  unzip
  tree
  youtube-dl
  fd # Alternative to find.

  # Document generation
  pandoc
  mdbook
  zola
  hugo
]
