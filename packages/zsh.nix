{pkgs,...}:
{
  enable = true;
  #autosuggestions.enable = true;
  syntaxHighlighting.enable = true;

  shellAliases = {
    ls = "eza";
    ll = "eza -l";
  };
}
