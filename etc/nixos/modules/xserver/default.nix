{ config, pkgs, ... }:

{
  nixpkgs.overlays = [
    (self: super: {
      dwm = super.dwm.overrideAttrs (old: {
        src = super.fetchFromGitHub {
          owner = "UzairQamarxyz";
          repo = "dwm";
          rev = "f94ca71aa4b7df9383d8873f95e602afba1722a7";
          hash = "sha256-BydC7A2zWyYv/U13ZD6iFoWDXsC6VJu3lY1e5bAGcVg=";
        };
      });
      dwmblocks = super.dwmblocks.overrideAttrs (old: {
        src = /home/uzair/Documents/git/dwmblocks-async;
        # src = super.fetchFromGitHub {
        #   owner = "UzairQamarxyz";
        #   repo = "dwmblocks";
        #   rev = "a933ce0d6109524b393feb3e7156cbf0de88b42c";
        #   hash = "";
        # };
      });
      dmenu = super.dmenu.overrideAttrs (old: {
        src = super.fetchFromGitHub {
          owner = "UzairQamarxyz";
          repo = "dmenu";
          rev = "2faf51c21e9e83f136677506271e592e28a8a6aa";
          hash = "sha256-CGSv44I0HDj70YCHGFpuMwh9V+vDQTgEiDS08KXuVOs=";
        };
      });
    })
  ];

  services = {
    unclutter-xfixes.enable = true;

    xserver = {
      enable = true;
      autorun = true;
      exportConfiguration = true;

      displayManager = {
        lightdm = {
          enable = true;
          background = "/home/uzair/Pictures/wallpaper.png";
          greeters.gtk = {
            theme.package = pkgs.flat-remix-gtk;
            theme.name = "Flat-Remix-GTK-Blue-Dark";

            iconTheme.package = pkgs.flat-remix-icon-theme;
            iconTheme.name = "Flat-Remix-Blue-Dark";

            cursorTheme.package = pkgs.bibata-cursors;
            cursorTheme.name = "Bibata-Modern-Ice";
            cursorTheme.size = 16;
          };
        };
      };

      windowManager.dwm.enable = true;
      layout = "us";
      xkbVariant = "dvorak";
      xkbOptions = "caps:escape_shifted_capslock";
      autoRepeatDelay = 200;
      autoRepeatInterval = 10;

      libinput = {
        enable = true;

        touchpad = {
          accelProfile = "flat";
          accelSpeed = "0.8";
          tappingDragLock = false;
        };
      };
    };
  };

  environment.etc."xdg/icon-theme/index.theme".text = ''
    [Icon-Theme]
    Inherits=Bibata-Modern-Ice
  '';

  environment.etc."xdg/gtk-2.0/settings.ini" = {
    text = ''
      [Settings]
      gtk-cursor-theme-name="Bibata-Modern-Ice"
    '';
  };

  environment.etc."xdg/gtk-3.0/settings.ini" = {
    text = ''
      [Settings]
      gtk-cursor-theme-name=Bibata-Modern-Ice
    '';
  };

  console = { useXkbConfig = true; };

  qt.platformTheme = "qt5ct";
}
