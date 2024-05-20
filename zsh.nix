{pkgs,...}:
{
  programs.zsh = {
            enable = true;
            autosuggestions.enable = true;
            #syntaxHighlighting.enable = true;

            shellAliases = {
              ll = "ls -l";
              update = "sudo nixos-rebuild switch";
            };

        };

        programs.fish = {
          enable = true;
        };


        programs.bash = {
  interactiveShellInit = ''
    if [[ $(${pkgs.procps}/bin/ps --no-header --pid=$PPID --format=comm) != "fish" && -z ''${BASH_EXECUTION_STRING} ]]
    then
      shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=""
      exec ${pkgs.fish}/bin/fish $LOGIN_OPTION
    fi
  '';
};

}
