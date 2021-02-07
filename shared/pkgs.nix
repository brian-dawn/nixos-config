# NOTE: this file is imported both by home.nix and configuration.nix.
{ pkgs, ... }:
let

  myPythonPackages = pythonPackages: with pythonPackages; [
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

  # Programming languages.
  # babashka
  clang
  # clojure
  crystal
  deno
  dhall
  elixir
  # futhark
  # gcc
  ghc
  go
  idris2
  janet
  julia
  nodejs
  octave
  zig

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

  # Document generation
  pandoc
  mdbook
  zola
  hugo
]
