{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [ zsh-syntax-highlighting nix-zsh-completions ];

  programs.zsh = {
    enable = true;
    dotDir = ".config/zsh";

    sessionVariables = {
      TYPEWRITTEN_CURSOR = "beam";
      TYPEWRITTEN_PROMPT_LAYOUT = "pure";
    };

    history = {
      path = "${config.xdg.dataHome}/zsh/history";
      size = 1000000;
      ignoreDups = true;
      extended = true;
      expireDuplicatesFirst = true;
    };

    historySubstringSearch.enable = true;

    enableCompletion = true;
    completionInit = ''
      autoload -U compinit && compinit -d ~/.cache/zcompdump-$ZSH_VERSION
    '';

    plugins = [
      {
        name = "typewritten";
        src = pkgs.fetchFromGitHub {
          owner = "reobin";
          repo = "typewritten";
          rev = "6f78ec20f1a3a5b996716d904ed8c7daf9b76a2a";
          hash = "sha256-qiC4IbmvpIseSnldt3dhEMsYSILpp7epBTZ53jY18x8=";
        };
      }
      {
        name = "zsh-syntax-highlighting";
        src = pkgs.fetchFromGitHub {
          owner = "zsh-users";
          repo = "zsh-syntax-highlighting";
          rev = "143b25eb98aa3227af63bd7f04413e1b3e7888ec";
          hash = "sha256-TKGCck51qQ50dQGntKaeSk8waK3BlwUjueg4MImTH8k==";
        };
      }
    ];

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "aws" "kubectl" "helm" "fzf" "terraform" "sudo" ];
    };
  };
}
