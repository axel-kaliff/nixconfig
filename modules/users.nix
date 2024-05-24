{ config, inputs, pkgs, ... }:

{
  users.users.akaliff = {
    isNormalUser = true;
    description = "Axel Kaliff";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  users.defaultUserShell = pkgs.fish;

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      "akaliff" = import ../home.nix;
    };
    backupFileExtension = "backup";
  };
}

