{ config, pkgs, ... }:

{
  services.desktopManager.cosmic.enable = true;
  services.displayManager.cosmic-greeter.enable = true;

  services.xserver.enable = true;
  services.xserver.xkb = {
    layout = "us";
    variant = "";
    options = "grp:alt_bksp_toggle";
  };

  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = ["FiraCode" "DroidSansMono" "Hack" "SourceCodePro"]; })
  ];

  environment.systemPackages = with pkgs; [
    gnome.gnome-tweaks
    wofi
    gnomeExtensions.pop-shell
    gnomeExtensions.caffeine
    gnomeExtensions.tray-icons-reloaded
    gnome.nautilus
    whatsapp-for-linux
  ];
}

