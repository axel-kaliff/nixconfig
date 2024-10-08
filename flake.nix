{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    flake-parts.url = "github:hercules-ci/flake-parts";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-hardware.url = "github:NixOS/nixos-hardware";

    disko.url = "github:nix-community/disko";

    disko.inputs.nixpkgs.follows = "nixpkgs";

    nixos-cosmic = {
      url = "github:lilyinstarlight/nixos-cosmic";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    xremap-flake.url = "github:xremap/nix-flake";
    
    auto-cpufreq = {
            url = "github:AdnanHodzic/auto-cpufreq";
            inputs.nixpkgs.follows = "nixpkgs";
        };

  };

  outputs = { self, nixpkgs, nixos-cosmic, auto-cpufreq, ... }@inputs: {

    nixosConfigurations.x260gnome = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };

      modules = [
        inputs.xremap-flake.nixosModules.default
        {
          nix.settings = {
            substituters = [ "https://cosmic.cachix.org/" ];
            trusted-public-keys = [ "cosmic.cachix.org-1:Dya9IyXD4xdBehWjrkPv6rtxpmMdRel02smYzA85dPE=" ];
          };
        }
        ./configurations/x260gnome.nix
        ./packages/xremap.nix
      ];
    };

    nixosConfigurations.t490 = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };

      modules = [
        inputs.xremap-flake.nixosModules.default
        {
          nix.settings = {
            substituters = [ "https://cosmic.cachix.org/" ];
            trusted-public-keys = [ "cosmic.cachix.org-1:Dya9IyXD4xdBehWjrkPv6rtxpmMdRel02smYzA85dPE=" ];
          };
        }
        ./configurations/t490-configuration.nix
        ./packages/xremap.nix
        auto-cpufreq.nixosModules.default
      ];
    };

    
  };
}

