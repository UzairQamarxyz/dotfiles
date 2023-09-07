{ config, pkgs, ... }:

{
  imports = [
    ./ricing
    ./development
  ];
  nixpkgs.config = {
    allowUnfree = true;
  };

  home.username = "uzair";
  home.homeDirectory = "/home/uzair";
  home.stateVersion = "23.05";

  home.packages = [
    pkgs.transmission
    pkgs.keepassxc
    pkgs.brightnessctl
    pkgs.xfce.xfce4-power-manager
    pkgs.xfce.xfce4-notifyd
    pkgs.flameshot
    pkgs.pcmanfm

    # Browsers
    pkgs.luakit
    pkgs.ungoogled-chromium
    pkgs.librewolf

    # Terminal
    pkgs.alacritty
    pkgs.jq
    pkgs.yq
    pkgs.fzf
    pkgs.ranger
    pkgs.mons
    pkgs.ffmpeg
    pkgs.ffmpegthumbnailer
    pkgs.zip
    pkgs.unzip

    # Audio/Bluetooth
    pkgs.bluetuith
    pkgs.blueman
    pkgs.bluez
    pkgs.pavucontrol
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
#  home.file = {
#    ".icons/default".source = "${pkgs.bibata-cursors}/share/icons/Bibata-Modern-Ice";
#  };

  xdg = {
    enable = true;
    userDirs = {
      enable = true;
      createDirectories = true;
    };
  };

  programs = {
    home-manager.enable = true;
    zsh.dotDir = "~/.config/zsh/zshrc";
  };

  services = {
    kdeconnect.enable = true;
  };

  xsession.enable = true;
}
