{ config, pkgs, ... }:

{
  environment = {
    systemPackages = with pkgs; [ zsh ];
    shells = with pkgs; [ zsh ];
  };
  users = { defaultUserShell = pkgs.zsh; };
  programs.zsh.enable = true;
}
