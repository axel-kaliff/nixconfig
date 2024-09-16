{ lib, inputs, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "akaliff";
  home.homeDirectory = "/home/akaliff";


  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.

  imports = [

    inputs.nixvim.homeManagerModules.nixvim
    ./packages/neovim.nix

  ];

  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
  mullvad-browser
  brave
	vlc
	file-roller
  loupe
  pick-colour-picker
  ##### engineering
  kitty
  ripgrep
	lazygit
	wget
	vscode
	alacritty
	python3
	z-lua
	rustup
	tmux
	eza
	sublime-merge
	bat
	broot
  du-dust
  atuin
  starship
  


	##### apps
  freetube
	#slack
	obsidian
	qbittorrent
	zoom-us
	discord
	libreoffice
	pinta
	spotify
	popsicle
	#evince
  firefox
  thunderbird
  libsForQt5.okular
  solaar
  bitwarden-desktop
  fastfetch
  kitty

  #xremap
  xkb-switch
    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".zshrc".source = dotfiles/zshrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. If you don't want to manage your shell through Home
  # Manager then you have to manually source 'hm-session-vars.sh' located at
  # either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/akaliff/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    EDITOR = "nvim";
    XKB_DEFAULT_LAYOUT = "us,se";
    XKB_DEFAULT_OPTIONS = "grp:win_space_toggle";
  };
  
  home.pointerCursor = {
      gtk.enable = true;
      # x11.enable = true;
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Classic";
      size = 12;
    };

  # Let Home Manager install and manage itself.
  programs = {
    home-manager.enable = true;
    fish = import ./packages/fish/fish.nix { inherit lib; inherit pkgs; };
    zsh = import ./packages/zsh.nix { inherit pkgs; };
    git = import ./packages/git.nix { inherit pkgs; };
    };
  }
