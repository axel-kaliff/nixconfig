{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.initrd.luks.devices."luks-f5fec819-00a0-497e-8382-663b5f90f6c1".device = "/dev/disk/by-uuid/f5fec819-00a0-497e-8382-663b5f90f6c1";
}

