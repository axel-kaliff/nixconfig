{ ... }:

{
  imports = [
    ./common-desktop.nix
  ];

  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
}

