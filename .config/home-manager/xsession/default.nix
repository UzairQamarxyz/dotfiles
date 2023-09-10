{ config, lib, pkgs, ... }:

{
  xsession = {
    enable = true;
#    profilePath = ".config/x11/xprofile";
#    scriptPath = ".config/x11/xsession";
    initExtra = ''
      xsetroot -cursor_name left_ptr
    '';
    profileExtra = ''
      xsetroot -cursor_name left_ptr
      xrdb ${config.xdg.configHome}/x11/xresources & xrdbpid=$!
      [ -n "$xrdbpid" ] && wait "$xrdbpid"
    '';
    numlock.enable = true;
  };
}
