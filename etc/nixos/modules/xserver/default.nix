{ config, pkgs, ... }:

{
  nixpkgs.overlays = [
    (self: super: {
      dwm = super.dwm.overrideAttrs (old: {
        src = /home/uzair/Documents/git/dwm;
        # src = super.fetchFromGitHub {
        #   owner = "UzairQamarxyz";
        #   repo = "dwm";
        #   rev = "cccc89fa7163be9ff89fb24c7880471be70000ca";
        #   hash = "sha256-EpsQjqhFjdC4q1G839SeJ65qiOWNJskAyAXQ5Vdynus=";
        # };
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
    })
  ];

  services = {
    unclutter-xfixes.enable = true;

    xserver = {
      enable = true;
      autorun = true;
      exportConfiguration = true;

      displayManager = { lightdm.enable = true; };

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

  console = { useXkbConfig = true; };

  qt.platformTheme = "qt5ct";
}
