{pkgs ? import <nixpkgs> {}}:
pkgs.mkShell {
  #nativeBuildInputs = with pkgs; [];  # only needed for developing nix/nixos
  buildInputs = with pkgs; [
    # common build inputs
    direnv
    xclip
    duf
    eza
    fd

    libcap
    go
    gcc
    python3
    nodejs
    # project-specific build inputs
    #bun
    #deno
    #rustup
    #nodejs
    #nodePackages.pnpm
  ];
  env = {
    #DENO_BIN="${pkgs.deno}/bin/deno";
    #NODE_BIN="${pkgs.nodejs}/bin/nodejs";
  };
  shellHook = ''
    #import parent shell config
    [ -x ~/.bashrc ] && source ~/.bashrc
    [ -x ~/.zshrc ] && source ~/.zshrc
    [ -x ~/.config/fish/config.fish ~/.config/fish/config.fish
  '';
}
