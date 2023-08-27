{ config, pkgs, ... }:

{

  nixpkgs.overlays = [
    (import (
      builtins.fetchTarball {
       url = https://github.com/nix-community/emacs-overlay/archive/86d5bb7.tar.gz;
       sha256 = "1smravcll3w08v4zx2h891dcp4qahg07wbi9rbgjjz2h4pw9vfp8";
      }))
  ];

  environment = {
    systemPackages = with pkgs; [
      pkgs.emacs-git  # Installs Emacs 28 + native-comp
      ripgrep
      coreutils
      fd
      clang
      neovim
      git
      slack
      shellcheck    
      python3Full
      terraform
      terraform-ls
      terraform-docs
      podman
      podman-tui
      kubectl
      kubernetes-helm
      helmfile
    ];
  };

  services = {
    emacs = {
      enable = true;
    };
  };

  virtualisation = {
    podman = {
      enable = true;
      autoPrune.enable = true;
    };
  };
}
