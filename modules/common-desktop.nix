{ pkgs, ... }:

{
  services.xserver.enable = true;
  services.xserver.xkb = {
    layout = "us,se";
    variant = "";
    options = "grp:win_space_toggle";
  };

  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = ["SourceCodePro" "FiraCode" "DroidSansMono" "Hack"]; })
  ];

  hardware.logitech.wireless.enable = true;
  services.flatpak.enable = true;

  environment.systemPackages = with pkgs; [
    gnome-tweaks
    wofi
    gnomeExtensions.pop-shell
    gnomeExtensions.caffeine
    gnomeExtensions.tray-icons-reloaded
    gnomeExtensions.blur-my-shell
    nautilus
    #power-profiles-daemon
    gnomeExtensions.gnome-40-ui-improvements
    flatpak-builder


    # add system76 scheduler? how would I benchmark?
    #linuxKernel.packages.linux_zen.system76-power
    # linuxKernel.packages.linux_zen.system76-scheduler

  ];
}

