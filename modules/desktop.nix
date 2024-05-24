{ config, pkgs, ... }:

{
  imports = [
    ./modules/common-desktop.nix
  ];

  services.desktopManager.cosmic.enable = true;
  services.displayManager.cosmic-greeter.enable = true;
}

