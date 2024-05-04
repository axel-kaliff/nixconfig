{
  programs = {
        zsh = {
            enable = true;
            autosuggestions.enable = true;
            syntaxHighlighting.enable = true;

            shellAliases = {
              ll = "ls -l";
              update = "sudo nixos-rebuild switch";
            };


            ohMyZsh = {
              enable = true;
              theme = "robbyrussell";
              plugins = [
                "git"
                "sudo"
                "npm"
                "history"
                "node"
                "rust"
                "deno"
              ];
            };
        };
  };
}
