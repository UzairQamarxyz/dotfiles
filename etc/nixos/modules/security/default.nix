{ config, pkgs, ... }:
{
  security = {
    polkit.enable = true;
    sudo = {
      enable = true;
      execWheelOnly = true;
      extraConfig = ''
      Defaults passwd_timeout=0
      Defaults timestamp_type=global
      Defaults timestamp_timeout=10
      Defaults env_keep += "ftp_proxy http_proxy https_proxy no_proxy"
      '';
    };
  };
}
