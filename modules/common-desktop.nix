{ pkgs, ... }:

{

  imports = [
    ./cosmic-desktop.nix
    ./gnome-desktop.nix
  ];

  services.xserver.enable = true;
  services.xserver.xkb = {
    layout = "us,se";
    variant = "";
    options = "grp:win_space_toggle";
  };

  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = ["SourceCodePro" "FiraCode" "DroidSansMono" "Hack"]; })
  ];

  # environment.systemPackages = with pkgs; [ 
  #   auto-cpufreq
  # ];

  hardware.logitech.wireless.enable = true;
  services.flatpak.enable = true;

  programs.auto-cpufreq.enable = true;

  environment.systemPackages = with pkgs; [

    wofi
    nautilus
    flatpak-builder

  ];
}

