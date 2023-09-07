# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.supportedFilesystems = [ "ntfs" ];

  imports =
    [ 
      ./hardware-configuration.nix
      ./modules/xserver
      ./modules/zsh
      ./modules/development
      ./modules/audio
      ./modules/security
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Setup keyfile
  boot.initrd.secrets = {
    "/crypto_keyfile.bin" = null;
  };

  # Enable swap on luks
  boot.initrd.luks.devices."luks-400078e1-c44e-4efb-a785-4dc724f37367".device = "/dev/disk/by-uuid/400078e1-c44e-4efb-a785-4dc724f37367";
  boot.initrd.luks.devices."luks-400078e1-c44e-4efb-a785-4dc724f37367".keyFile = "/crypto_keyfile.bin";

  networking.hostName = "nixos"; # Define your hostname.
  networking = {
   networkmanager.enable = true;
   extraHosts = ''
   172.25.25.10 gerrit.xgrid.co
   172.25.25.20 jenkins.xgrid.co
   '';
  };

  # Set your time zone.
  time.timeZone = "Asia/Karachi";

  # Select internationalisation properties.
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

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Define a user account.
  users = {
    users.uzair = {
      isNormalUser = true;
      description = "Uzair Qamar";
      extraGroups = [ "networkmanager" "wheel" ];
      packages = with pkgs; [
        firefox
      ];
    };
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  environment = { 
    etc = {
      "wireplumber/bluetooth.lua.d/51-bluez-config.lua".text = ''
          bluez_monitor.properties = {
              ["bluez5.enable-sbc-xq"] = true,
              ["bluez5.enable-msbc"] = true,
              ["bluez5.enable-hw-volume"] = true,
              ["bluez5.headset-roles"] = "[ hsp_hs hsp_ag hfp_hf hfp_ag ]"
          }
      '';
    };

    systemPackages = with pkgs; [
      # Essentials
      wget
      neovim

      ## Xorg
      xorg.xorgserver
      xorg.xf86inputevdev
      xorg.xf86inputsynaptics
      xorg.xf86inputlibinput
      xorg.xf86videointel
      xorg.xbacklight
      xorg.xset
      xorg.xrdb
      xorg.xkill
      xorg.xev
      xclip
      xsel
      dwm-status
      dmenu

      flat-remix-gtk
      flat-remix-icon-theme
      bibata-cursors
    ];

    variables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
    };
  };

  services.openssh.enable = true;

  networking.firewall.enable = false;

  system.stateVersion = "23.05";

  programs = {
    dconf.enable = true;
    xfconf.enable = true;
    thunar.enable = true;
  };

  nix = {
    settings.auto-optimise-store = true;
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };
  };
}
