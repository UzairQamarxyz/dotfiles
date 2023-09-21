{ config, pkgs, ... }:

{
  imports = [ ./ricing ./development ./xsession ./zsh ./xdg ];
  nixpkgs.config = { allowUnfree = true; };

  home.username = "uzair";
  home.homeDirectory = "/home/uzair";
  home.stateVersion = "23.05";

  home.sessionPath = [ "$HOME/.local/bin" ];

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
    mpv

    # Internet
    luakit
    ungoogled-chromium
    librewolf
    transmission-gtk

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
    killall

    # Audio/Bluetooth
    bluetuith
    blueman
    bluez
    pavucontrol
  ];

  programs = { home-manager.enable = true; };

  services = { kdeconnect.enable = true; };
}
