# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./modules/xserver
    ./modules/zsh
    ./modules/development
    ./modules/audio
    ./modules/security
  ];
  nix = {
    settings.auto-optimise-store = true;
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };
  };

  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.supportedFilesystems = [ "ntfs" ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.initrd.secrets = { "/crypto_keyfile.bin" = null; };

  boot.initrd.luks.devices."luks-400078e1-c44e-4efb-a785-4dc724f37367".device =
    "/dev/disk/by-uuid/400078e1-c44e-4efb-a785-4dc724f37367";
  boot.initrd.luks.devices."luks-400078e1-c44e-4efb-a785-4dc724f37367".keyFile =
    "/crypto_keyfile.bin";

  networking.hostName = "nixos";
  networking = {
    networkmanager.enable = true;
    extraHosts = ''
      172.25.25.10 gerrit.xgrid.co
      172.25.25.20 jenkins.xgrid.co
    '';
  };

  time.timeZone = "Asia/Karachi";

  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  services.printing.enable = true;

  users = {
    users.uzair = {
      isNormalUser = true;
      description = "Uzair Qamar";
      extraGroups = [ "networkmanager" "wheel" ];
      packages = with pkgs; [ firefox ];
    };
  };

  nixpkgs.config.allowUnfree = true;
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

  environment = {
    systemPackages = with pkgs; [
      # Essentials
      wget
      curl
      neovim
      nix-prefetch-github
      bibata-cursors

      ## Xorg
      xorg.libX11.dev
      xorg.libXft
      xorg.libXinerama
      xorg.xbacklight
      xorg.xset
      xorg.xrdb
      xorg.xkill
      xorg.xev
      xclip
      xsel
      dwm-status
      dwmblocks
      dmenu
    ];

    variables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
    };
  };

  services.openssh.enable = true;

  networking.firewall.enable = false;

  system.stateVersion = "unstable";

  programs = {
    dconf.enable = false;
    xfconf.enable = false;
  };
}
