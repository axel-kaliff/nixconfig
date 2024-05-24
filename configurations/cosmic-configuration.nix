{ config, pkgs, inputs, ... }:

{
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  imports = [
    ./../clients/thinkpad/hardware.nix
    ./../modules/cosmic-desktop.nix
    ./../modules/networking.nix
    ./../modules/users.nix
    ./../modules/system.nix
    ./../modules/audio.nix
    ./../packages.zsh.nix
    inputs.home-manager.nixosModules.default
    inputs.nixos-cosmic.nixosModules.default
  ];
}
