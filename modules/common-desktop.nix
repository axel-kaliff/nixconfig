{ pkgs, ... }:

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

  hardware.logitech.wireless.enable = true;

  environment.systemPackages = with pkgs; [
    gnome-tweaks
    wofi
    gnomeExtensions.pop-shell
    gnomeExtensions.caffeine
    gnomeExtensions.tray-icons-reloaded
    gnomeExtensions.blur-my-shell
    nautilus
    whatsapp-for-linux
    power-profiles-daemon
    gnomeExtensions.gnome-40-ui-improvements


    # add system76 scheduler? how would I benchmark?
    #linuxKernel.packages.linux_zen.system76-power
    # linuxKernel.packages.linux_zen.system76-scheduler

  ];
}

