{ config, pkgs, ... }:

{
  nixpkgs.overlays = [
    (final: prev: {
      dwm = prev.dwm.overrideAttrs
      (old: {
        src = /home/uzair/.config/dwm ;
      });
    })
  ];

  services = {
    unclutter-xfixes.enable = true;

    dwm-status = {
      enable = true;
      order = ["audio" "battery" "network" "time"];
      extraConfig = ''
        separator = "    "

        [audio]
        template = "{ICO} {VOL}%"
        icons = ["󰕿", "󰖀", "󰕾"]

        [battery]
        notifier_levels = [2, 5, 10, 15, 20]
        charging = ""
        discharging = ""
        no_battery = ""
        icons = ["", "", "", "", "", "", "", "", "", "", ""]

        [network]
        template = "{IPv4} · {ESSID}"

        [time]
        format = "%Y-%m-%d · %I:%M%p"
        update_seconds = true
      '';
    };

    xserver = {
      # Enable the X11 windowing system.
      enable = true;
      autorun = true;
      exportConfiguration = true;

      displayManager = {
        startx.enable = false;

        lightdm = {
          enable = true;
        };
      };

      windowManager.dwm = {
        enable = true;
      };

      layout = "us";
      xkbVariant = "dvorak";
      xkbOptions = "caps:escape_shifted_capslock";
      autoRepeatDelay = 200;
      autoRepeatInterval = 10;

      libinput = {
        enable = true;

        # disabling touchpad acceleration
        touchpad = {
          accelProfile = "flat";
          accelSpeed = "0.8";
          tappingDragLock = false;
        };
      };
    };
  };

  # Configure console keymap
  console = {
    useXkbConfig = true;
  };

  qt.platformTheme = "qt5ct";
}
