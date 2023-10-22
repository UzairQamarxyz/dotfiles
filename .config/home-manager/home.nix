{ config, pkgs, ... }:

{
  imports = [ ./ricing ./development ./xsession ./zsh ./xdg ./gaming ];
  nixpkgs.config = { allowUnfree = true; };

  home.username = "uzair";
  home.homeDirectory = "/home/uzair";
  home.stateVersion = "23.05";

  home.sessionPath = [ "$HOME/.local/bin" ];

  home.packages = with pkgs; [
    kotatogram-desktop
    networkmanager
    networkmanagerapplet
    keepassxc
    brightnessctl
    xfce.xfce4-power-manager
    xfce.xfce4-notifyd
    flameshot
    pcmanfm
    nsxiv
    feh
    mpv
    udisks
    udiskie
    appimage-run
    notation
    docker-credential-helpers
    pass
    gnupg
    pinentry

    # Internet
    luakit
    ungoogled-chromium
    librewolf
    transmission-gtk
    python311Packages.deemix
    syncthing

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
    tauon
    cmus
    # etcher
    woeusb-ng
  ];

  programs = { home-manager.enable = true; };

  services = { kdeconnect.enable = true; };
}
