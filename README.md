# NixOS Config

I just symlink `/etc/nixos/configuration.nix`, and `~/.config/nixpkgs/home.nix` to this repo.

# Tips and Tricks

Re-sync system with configuration:

    sudo nixos-rebuild switch

Re-sync home manager with configuration:

    home-manager switch

Update the nix channel (for updating software):

    sudo nix-channel --update
    sudo nixos-rebuild switch

Cleanup stuff in the nix store:

    nix collect-garbage -d
