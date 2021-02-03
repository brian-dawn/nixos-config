# NixOS Config

I just symlink `/etc/nixos/configuration.nix`, and `~/.config/nixpkgs/home.nix` to this repo.

You also need to create a file in this repo called `local.nix`. This is where computer specific settings
can be set. Here's the structure of it:

```nix
{
  networking.hostName = "pantalaimon";
}

```

# Tips and Tricks

Re-sync system with configuration:

    sudo nixos-rebuild switch

Re-sync home manager with configuration:

    home-manager switch

Update the nix channel (for updating software):

    sudo nixos-rebuild switch --upgrade

Search for packages:

    nix-env -qa [package-name]

Cleanup stuff in the nix store:

    nix collect-garbage -d

Format some nix files:

    nixpkgs-format file.nix
