{
  # Import all your configuration modules here
  imports = [
    ./bufferline.nix
  ];

  colorschemes.gruvbox.enable = true;

  plugins = {
  	lualine.enable = true;
	telescope.enable = true;
	oil.enable = true;
	treesitter.enable = true;
	luasnip.enable = true;
	harpoon.enable = true;
  };

  plugins.lsp = {
  	enable = true;
	servers = {
	lua-ls.enable = true;
	rust-analyzer.enable = true;
	};
	};

plugins.cmp = {
	enable = true;
	autoEnableSources = true;
	};


}
