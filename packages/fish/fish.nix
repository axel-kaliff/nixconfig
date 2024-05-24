# programs.fish =
{ lib, pkgs, ...}: {

	enable = true;
	shellAliases = import ./fish-aliases.nix;
	shellInit = lib.strings.concatMapStringsSep "\n" builtins.readFile [
		./fish-extra-shell-init.fish
		./fish-extra-shell-init-nixos.fish
	];

  plugins = [
      { name = "bobthefish"; src = pkgs.fishPlugins.bobthefish.src; }
      # Manually packaging and enable a plugin
      {
        name = "z";
        src = pkgs.fetchFromGitHub {
          owner = "jethrokuan";
          repo = "z";
          rev = "e0e1b9dfdba362f8ab1ae8c1afc7ccf62b89f7eb";
          sha256 = "0dbnir6jbwjpjalz14snzd3cgdysgcs3raznsijd6savad3qhijc";
        };
      }
    ];

}
