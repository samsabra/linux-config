# Nixos move plan

1. Backup partition
2. Format in btrfs with luks
3. Get ssh keys
4. clone this repo
5. get main keepass file.
6. setup syncthing
7. setup email

I think it's a bad idea to put everything in nix from the beginning
(I acrued to much over the years), 
but we can keep on adding custimizations over time.

## Resources

### btrfs

some thread where it maybe does work: https://github.com/NixOS/nixpkgs/issues/15786
script: https://gist.github.com/samdroid-apps/3723d30953af5e1d68d4ad5327e624c0


### xmodmap
fals://github.com/gilligan/nixos-config/blob/master/configuration.nix#L114

### emacs
https://github.com/NixOS/nixpkgs/blob/c836833c0125d31f5ec11e5121ba73f89ec4b9fa/pkgs/top-level/emacs-packages.nix