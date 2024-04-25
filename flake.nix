{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
       url = "github:nix-community/home-manager";
       inputs.nixpkgs.follows = "nixpkgs";
     };

    nixos-cosmic = {
      url = "github:lilyinstarlight/nixos-cosmic";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    xremap-flake.url = "github:xremap/nix-flake";

  };

  outputs = { self, nixpkgs, nixos-cosmic, ... }@inputs: {
    nixosConfigurations.default = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};

    modules = [
      
    inputs.xremap-flake.nixosModules.default
            {
                nix.settings = {
                substituters = [ "https://cosmic.cachix.org/" ];
                trusted-public-keys = [ "cosmic.cachix.org-1:Dya9IyXD4xdBehWjrkPv6rtxpmMdRel02smYzA85dPE=" ];
                };
    
   services.xremap.config.modmap = [
                {
                name = "Global";
                remap = { 
    
                    "Alt_L" = "Win_L"; 
                    "Win_L" = "Alt_L"; 
                    "CapsLock" = "LeftCtrl"; 
    
               }; 
                }
            ];
    
       services.xremap.config.keymap = [
                {
                    name = "navigation";
                    remap = { 
        "C-k" = "PAGEUP"; 
        "C-j" = "PAGEDOWN"; 
        };
                }
                ];
            }
            nixos-cosmic.nixosModules.default
            ./configuration.nix
            inputs.home-manager.nixosModules.default
    
            #inputs.nixvim.nixosModules.nixvim
            #./nixvim/nixvim.nix
    
        ];
        };





  };
}
