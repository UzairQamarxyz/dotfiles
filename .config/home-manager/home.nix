{ config, pkgs, ... }:

{
  nixpkgs.config = {
    allowUnfree = true;
  };

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "uzair";
  home.homeDirectory = "/home/uzair";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    # Browsers
    pkgs.luakit
    pkgs.ungoogled-chromium
    pkgs.librewolf

    # Terminal
    pkgs.alacritty
    pkgs.yakuake
    pkgs.jq
    pkgs.yq
    pkgs.fzf
    pkgs.ranger

    # Ricing
    pkgs.libsForQt5.qtstyleplugins
    pkgs.flat-remix-gtk
    pkgs.flat-remix-icon-theme
    pkgs.bibata-cursors
    (pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" "Noto" "Overpass" ]; })

    # Development
    ## Misc.
    pkgs.git
    pkgs.ripgrep
    pkgs.coreutils
    pkgs.fd
    pkgs.clang
    pkgs.slack
    pkgs.shellcheck
    pkgs.gnumake
    pkgs.cmake
    pkgs.gore
    pkgs.gotools
    pkgs.gopls
    pkgs.gomodifytags

    ## Python
    pkgs.python3Full

    ## IAC
    pkgs.terraform
    pkgs.terraform-ls
    pkgs.terraform-docs

    ## Docker & K8s
    pkgs.podman-tui
    pkgs.kubectl
    pkgs.kubernetes-helm
    pkgs.helmfile
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # You can also manage environment variables but you will have to manually
  # source
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/uzair/etc/profile.d/hm-session-vars.sh
  #
  # if you don't want to manage your shell through Home Manager.
  home.sessionVariables = {
    EDITOR = "nvim";
  };

  xdg = {
    enable = true;
    userDirs = {
      enable = true;
      createDirectories = true;
    };
  };

  programs = {
    # Let Home Manager install and manage itself.
    home-manager.enable = true;
    emacs.enable = true;
    neovim = {
      enable = true;
      defaultEditor = true;
      extraLuaConfig = ''
        local opt = vim.opt
        
        opt.relativenumber = true
        opt.nu = true
        opt.cursorline = false
        opt.linebreak = true
        opt.showbreak = "+++"
        opt.showmatch = true
        
        opt.smartcase = true
        opt.ignorecase = true
        opt.autoindent = true
        opt.expandtab = true
        opt.smarttab = true
        opt.ruler = true
        opt.cindent = true
        opt.wrap = false
        opt.tabstop = 4
        opt.shiftwidth = 4
        opt.softtabstop = -1
        opt.list = true
        opt.listchars = "trail:·,nbsp:◇,tab:→ ,extends:▸,precedes:◂"
        
        opt.clipboard = "unnamedplus"
        
        opt.swapfile = false
        opt.backup = false
        opt.undodir = os.getenv("HOME") .. "/.cache/nvim/undodir"
        opt.undofile = true
        
        opt.hlsearch = false
        opt.incsearch = true
        
        opt.termguicolors = true
        
        opt.scrolloff = 8
        opt.signcolumn = "yes"
        opt.isfname:append("@-@")
        
        opt.updatetime = 50
        
        -- Better buffer splitting
        opt.splitright = true
        opt.splitbelow = true
      '';
    };
  };

  services = {
    kdeconnect.enable = true;
    emacs.enable = true;
  };

  gtk = {
    enable = true;
    theme.name = "Flat-Remix-GTK-Blue-Dark";
    cursorTheme.name = "Bibata-Modern-Ice";
    iconTheme.name = "Flat-Remix-Blue-Dark";
    gtk2.extraConfig = ''
      gtk-application-prefer-dark-theme = true;
      gtk-font-name = "NotoSans Nerd Font, 10";
    '';
    gtk3 = {
        extraCss = ''
          VteTerminal, vte-terminal {
            padding: 30px;
          }
        '';
        extraConfig = {
          "gtk-application-prefer-dark-theme" = true;
          "gtk-font-name" = "NotoSans Nerd Font, 10";
        };
    };
    gtk4.extraConfig = {
      "gtk-application-prefer-dark-theme" = true;
      "gtk-font-name" = "NotoSans Nerd Font, 10";
    };
  };

  qt = {
    enable = true;
    style.package = pkgs.libsForQt5.qtstyleplugins;
    platformTheme = "gtk";
  };
}
