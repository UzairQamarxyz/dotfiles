{ config, lib, pkgs, ... }:

{
  home.sessionVariables = {
    KUBECONFIG = "${config.xdg.configHome}/kube";
    CARGO_HOME = "${config.xdg.configHome}/cargo";
    AWS_SHARED_CREDENTIALS_FILE = "${config.xdg.configHome}/aws/credentials";
    AWS_CONFIG_FILE = "${config.xdg.configHome}/aws/config";
    EDITOR = "nvim";
    VISUAL = "nvim";
    BROWSER = "librewolf";
    XCURSOR_DISCOVER = 1;
  };
  xdg = {
    enable = true;
    userDirs = {
      enable = true;
      createDirectories = true;
      publicShare = null;
      templates = null;
    };
  };
}
