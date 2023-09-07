{ config, pkgs, ... }:

{
  environment = {
    systemPackages = with pkgs; [
      clang
      gnumake
      cmake
      gcc
      podman
    ];
  };

  virtualisation = {
    podman = {
      enable = true;
      autoPrune.enable = true;
      dockerCompat = true;
      defaultNetwork.settings = {
        dns_enabled = true;
      };
    };
  };
}
