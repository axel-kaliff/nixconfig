{ inputs, ... }:

{
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  imports = [
    ./../clients/t490/hardware.nix
    ./../modules/gnome-desktop.nix
    ./../modules/networking.nix
    ./../modules/users.nix
    ./../modules/system.nix
    ./../modules/audio.nix
    # ./../packages/zsh.nix
    inputs.home-manager.nixosModules.default
  ];
}

