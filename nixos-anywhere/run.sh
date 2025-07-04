rm ../hardware-configuration.nix

nix run github:nix-community/nixos-anywhere -- \
        --generate-hardware-config nixos-generate-config ../hardware-configuration.nix \
        --flake .#nixos \
        --target-host root@localhost \
        --ssh-port 2222

rm ../hardware-configuration.nix
