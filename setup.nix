{ config, lib, pkgs, ... }:

{
  system.activationScripts.copyConfig.text = ''
    cp . /etc/nixos
  '';
}

