{ config, pkgs, ... }:

{
  services.xserver.enable = true;
  services.xserver.xkb = {
    layout = "us";
    variant = "";
    options = "grp:win_space_toggle";
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

