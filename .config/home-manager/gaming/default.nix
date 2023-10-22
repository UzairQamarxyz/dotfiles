{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [ wineWowPackages.full steam protontricks ];
}
