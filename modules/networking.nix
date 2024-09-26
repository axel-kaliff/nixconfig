{ ... }:

{
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  # OpenSSH configuration
  services.openssh.enable = true;
}

