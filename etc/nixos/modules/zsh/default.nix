{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;

    promptInit = ''
    autoload -U promptinit && promptinit && prompt suse && setopt prompt_sp
    prompt pure
    '';

    setOptions = [
      "BANG_HIST"
      "EXTENDED_HISTORY"
      "INC_APPEND_HISTORY"
      "SHARE_HISTORY"
      "HIST_EXPIRE_DUPS_FIRST"
      "HIST_IGNORE_DUPS"
      "HIST_IGNORE_ALL_DUPS"
      "HIST_FIND_NO_DUPS"
      "HIST_SAVE_NO_DUPS"
      "HIST_REDUCE_BLANKS"
      "HIST_VERIFY"
    ];

    syntaxHighlighting.enable = true;

    histFile = "~/.local/share/zsh/history";
    histSize = 10000000;

    ohMyZsh = {
      enable = true;
      customPkgs = [
        pkgs.zsh-syntax-highlighting
        pkgs.zsh-history-substring-search
        pkgs.nix-zsh-completions
        pkgs.pure-prompt
      ];
      plugins = [ 
        "git"
        "aws"
        "kubectl"
        "helm"
        "fzf"
        "terraform"
        "sudo"
      ];
      theme = "";
    };
  };

  environment = {
    systemPackages = with pkgs; [
      zsh
      zsh-syntax-highlighting
      zsh-history-substring-search
      nix-zsh-completions
      pure-prompt
    ];
    shells = with pkgs; [ zsh ];
  };

  users = {
    defaultUserShell = pkgs.zsh;
  };
}
