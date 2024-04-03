# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

# nix path: /home/akaliff/.nix-defexpr/channels:nixpkgs=/nix/var/nix/profiles/per-user/root/channels/nixos:nixos-config=/etc/nixos/configuration.nix:/nix/var/nix/profiles/per-user/root/channels

{ config, pkgs, ... }:

let
  unstableTarball =
    fetchTarball
      https://github.com/NixOS/nixpkgs/archive/nixos-unstable.tar.gz;
in
{

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  imports =
    [ # Include the results of the hardware scan.
      /etc/nixos/hardware-configuration.nix
    ];

  nixpkgs.config = {
    packageOverrides = pkgs: {
      unstable = import unstableTarball {
        config = config.nixpkgs.config;
      };
    };
  };

	  environment.systemPackages = with pkgs;[
		# engineering
		neovim 
		wget
		conda
		vscode
		mujoco
		alacritty
		zsh
		python3
		z-lua
		rustup
		cosmic-edit
		oh-my-zsh
		thefuck
		tmux
		eza
		git
		sublime-merge
		bat

		# desktop environment
		gnome.gnome-tweaks
		wofi
		gnomeExtensions.pop-shell
		gnomeExtensions.caffeine
		gnomeExtensions.tray-icons-reloaded

		# apps
		obsidian
		vlc
		qbittorrent
		zoom-us
		discord
		discordo
		libreoffice-qt
		pinta
		spot
		spotify
		popsicle
		element-desktop

		# cosmic
		/*
		unstable.cosmic-edit
		unstable.cosmic-settings
		unstable.cosmic-term
		unstable.cosmic-bg
		unstable.cosmic-osd
		unstable.cosmic-comp
		unstable.cosmic-store
		unstable.cosmic-randr
		unstable.cosmic-panel
		unstable.cosmic-icons
		unstable.cosmic-files
		unstable.cosmic-session
		unstable.cosmic-greeter
		unstable.cosmic-applets
		unstable.cosmic-launcher
		unstable.cosmic-protocols
		unstable.cosmic-screenshot
		unstable.cosmic-applibrary
		unstable.cosmic-notifications
		unstable.cosmic-settings-daemon
		unstable.cosmic-workspaces-epoch
		unstable.xdg-desktop-portal-cosmic
		unstable.cosmic-design-demo
		*/

	];



  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.initrd.luks.devices."luks-f5fec819-00a0-497e-8382-663b5f90f6c1".device = "/dev/disk/by-uuid/f5fec819-00a0-497e-8382-663b5f90f6c1";
  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Stockholm";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "sv_SE.UTF-8";
    LC_IDENTIFICATION = "sv_SE.UTF-8";
    LC_MEASUREMENT = "sv_SE.UTF-8";
    LC_MONETARY = "sv_SE.UTF-8";
    LC_NAME = "sv_SE.UTF-8";
    LC_NUMERIC = "sv_SE.UTF-8";
    LC_PAPER = "sv_SE.UTF-8";
    LC_TELEPHONE = "sv_SE.UTF-8";
    LC_TIME = "sv_SE.UTF-8";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  #services.xserver.desktopManager.cosmic.enable = true;
  #services.xserver.displayManager.cosmic-greeter.enable = true;

  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.akaliff = {
    isNormalUser = true;
    description = "Axel Kaliff";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      firefox
      thunderbird
    ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  


  programs.zsh = {
	  enable = true;
	  enableCompletion = true;
	  enableAutosuggestions = true;
	  syntaxHighlighting.enable = true;

	  shellAliases = {
	    ll = "ls -l";
	    update = "sudo nixos-rebuild switch";
	  };

	  oh-my-zsh = {
	    enable = true;
	    plugins = [ "git" "thefuck"];
	    theme = "robbyrussell";
	  };
  };

  users.defaultUserShell = pkgs.zsh;

  nixpkgs.config.permittedInsecurePackages = [
                "electron-25.9.0"
		"qtwebkit-5.212.0-alpha4"
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?


 programs.neovim = {
  enable = true;
  defaultEditor = true;
  viAlias = true;
  vimAlias = true;
};
 
 # programs.neovim.extraConfig = lib.fileContents ../path/to/your/init.vim;


}
