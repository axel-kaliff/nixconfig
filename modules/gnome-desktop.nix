{ pkgs, ...}:

{

  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  environment.systemPackages = with pkgs; [ 
    gnome-tweaks
    gnomeExtensions.appindicator
    gnomeExtensions.pop-shell
    gnomeExtensions.caffeine
    gnomeExtensions.tray-icons-reloaded
    gnomeExtensions.blur-my-shell
    gnomeExtensions.gnome-40-ui-improvements
  ];

}

