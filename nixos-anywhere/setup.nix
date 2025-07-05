{ config, lib, pkgs, ... }:

{
  system.activationScripts.copyConfig.text = ''
    rm -rf /home/niwan/nixos-config

	mkdir -p /home/niwan/nixos-config
	git clone https://github.com/N1wan/nixos.git /home/niwan/nixos-config

	mv ./hardware-configuration.nix /home/niwan/nixos-config/hardware-configuration.nix

    sudo rm -rf /etc/nixos
	ln -s /home/niwan/nixos-config /etc/nixos
  '';
}

