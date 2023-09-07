{ config, lib, pkgs, ... }:

{
  home.packages = [
    # Ricing
    pkgs.pywal
    pkgs.ueberzug
    pkgs.betterlockscreen
    pkgs.libsForQt5.qtstyleplugins
    pkgs.flat-remix-gtk
    pkgs.flat-remix-icon-theme
    pkgs.font-manager
    pkgs.emacs-all-the-icons-fonts
    pkgs.emacsPackages.unicode-fonts
    pkgs.lxappearance
    (pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" "Noto" "Overpass" ]; })
  ];

  services = {
    picom = {
      enable = true;
      backend = "glx";
      settings = {
        blur = {
          method = "dual_kawase";
          strength = 2;
          size = 10;
          deviation = 5.0;
        };
        blur-background = true;
        blur-kern = "3x3box";
        no-dnd-shadow = true;
        focus-exclude = "x = 0 && y = 0 && override_redirect = true";
      };
      shadow = true;
      shadowExclude = [
        "x = 0 && y = 0 && override_redirect = true"
        "name = 'Notification'"
        "class_g ?= 'Notify-osd'"
        "class_g = 'Librewolf' && window_type *= 'utility'"
        "_GTK_FRAME_EXTENTS@:c"
      ];
      opacityRules = [
        "90:class_g = 'Alacritty'"
      ];
      wintypes = {
        tooltip = { fade = true; shadow = true; opacity = 1; focus = true; full-shadow = false; };
        dock = { shadow = false; };
        dnd = { shadow = false; };
        popup_menu = { opacity = 1; };
        dropdown_menu = { opacity = 1; };
      };
    };

  };

  gtk = {
    enable = true;

    theme.package = pkgs.flat-remix-gtk;
    theme.name = "Flat-Remix-GTK-Blue-Dark";

    font.name = "Proxima Nova";
    font.size = 10;

    cursorTheme.package = pkgs.bibata-cursors;
    cursorTheme.name = "Bibata-Modern-Ice";

    iconTheme.package = pkgs.flat-remix-icon-theme;
    iconTheme.name = "Flat-Remix-Blue-Dark";

    gtk2 = {
        configLocation = "${config.xdg.configHome}/gtk-2.0/gtkrc";
    };
  };

  qt.enable = true;

  home.pointerCursor = {
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Ice";
    size = 24;
    gtk.enable = true;
    x11.enable = true;
    x11.defaultCursor = "default";
  };

  xresources.extraConfig = ''
    #include "${config.xdg.cacheHome}/wal/colors.Xresources"
  '';
}
