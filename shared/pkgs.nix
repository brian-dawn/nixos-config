{ pkgs, ... }:
with pkgs; [

    # Programming languages.
    babashka
    clang
    clojure
    crystal
    deno
    dhall
    elixir
    futhark
    gcc
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

    # Document generation
    pandoc
    mdbook
    zola
    hugo
]
