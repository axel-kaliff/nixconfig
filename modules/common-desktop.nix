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
    nerd-fonts.sauce-code-pro
    nerd-fonts.fira-code
    nerd-fonts.droid-sans-mono
    nerd-fonts.hack
  ];

  hardware.logitech.wireless.enable = true;
  services.flatpak.enable = true;

  programs.auto-cpufreq.enable = true;

  environment.systemPackages = with pkgs; [

    wofi
    nautilus
    flatpak-builder
    wl-clipboard

  ];
}

