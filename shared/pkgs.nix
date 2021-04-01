# NOTE: this file is imported both by home.nix and configuration.nix.
{ pkgs, ... }:
let

  myPythonPackages = pythonPackages: with pythonPackages; [
    ec2instanceconnectcli

    # numpy
    # pandas
    #scikitlearn
    # matplotlib
    # pytorch
    # ipython
  ];
in
with pkgs; [

  # Fix python libstdc++ issues.
  stdenv.cc.cc.lib


  # Cloud stuff
  awscli2
  google-cloud-sdk
  heroku
  httpie

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
  nim
  deno
  dhall
  dhall-lsp-server
  elixir
  # futhark
  # gcc
  gccStdenv
  ghc
  go
  idris2
  janet
  #julia
  nodejs
  octave
  rustup
  poetry

  #zig


  jdk11
  ktlint

  # CLI tools.
  pijul

  # Document generation
  pandoc
  mdbook
  zola
  hugo
] ++ (import ./core-pkgs.nix pkgs)
