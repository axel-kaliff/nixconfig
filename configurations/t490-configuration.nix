{ inputs, pkgs,... }:

{
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  boot.kernelPackages = pkgs.linuxPackages_latest;

  imports = [
    ./../clients/t490/hardware.nix
    ./../modules/common-desktop.nix
    ./../modules/networking.nix
    ./../modules/users.nix
    ./../modules/system.nix
    ./../modules/audio.nix
    #./../packages.zsh.nix
    inputs.home-manager.nixosModules.default
    inputs.nixos-cosmic.nixosModules.default
  ];
}

