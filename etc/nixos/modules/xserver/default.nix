{ config, pkgs, ... }:

{
  nixpkgs.overlays = [
    (self: super: {
      dwm = super.dwm.overrideAttrs (old: {
        src = super.fetchFromGitHub {
          owner = "UzairQamarxyz";
          repo = "dwm";
          rev = "8c0f07e24c445fd1cf80250909d1f19eefaa6752";
          hash = "sha256-rnnDD8yokDdYgC8U01YvZKTWKWT/u3fHXykDqyOrTOw=";
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
          rev = "b66f815f20303c409ffd4ac6a5873fe5c5761b21";
          hash = "sha256-D6QYCGURK10P2OWTDr5uUk367m8Oksmq6MjLrnDPXNE=";
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
