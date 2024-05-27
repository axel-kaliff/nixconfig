{ config, pkgs, ...}:
{
  services.xremap.enable = true;
 

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

