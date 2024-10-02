{lib, ...}:
{
  programs.neovim = {
    enable = true;

    extraLuaConfig = "${builtins.readFile ./nvim/init.lua}";

  };
}
