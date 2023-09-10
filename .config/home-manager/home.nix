{ config, pkgs, ... }:

{
  imports = [ ./ricing ./development ./xsession ./zsh ];
  nixpkgs.config = { allowUnfree = true; };

  home.username = "uzair";
  home.homeDirectory = "/home/uzair";
  home.stateVersion = "23.05";

  home.packages = with pkgs; [
    # Utils
    networkmanager
    networkmanagerapplet
    keepassxc
    brightnessctl
    xfce.xfce4-power-manager
    xfce.xfce4-notifyd
    flameshot
    pcmanfm
    feh

    # Internet
    luakit
    ungoogled-chromium
    librewolf
    transmission

    # Terminal & CLI Utils
    alacritty
    jq
    yq
    fzf
    ranger
    mons
    ffmpeg
    ffmpegthumbnailer
    zip
    unzip

    # Audio/Bluetooth
    bluetuith
    blueman
    bluez
    pavucontrol
  ];

  xdg = {
    enable = true;
    userDirs = {
      enable = true;
      createDirectories = true;
    };
  };

  programs = { home-manager.enable = true; };

  services = { kdeconnect.enable = true; };
}
