{ config, lib, pkgs, ... }:

{
  home.packages = [
    # Development
    ## Misc.
    pkgs.nodejs
    pkgs.libtool
    pkgs.git
    pkgs.ripgrep
    pkgs.coreutils
    pkgs.fd
    pkgs.slack
    pkgs.shellcheck
    pkgs.gore
    pkgs.gotools
    pkgs.gopls
    pkgs.gomodifytags
    pkgs.gotests
    pkgs.black
    pkgs.isort
    pkgs.pipenv
    pkgs.shfmt
    pkgs.python311Packages.grip
    pkgs.python311Packages.pyflakes
    pkgs.python311Packages.pyflakes
    pkgs.python311Packages.nose
    pkgs.pre-commit

    ## Python
    pkgs.python3Full

    ## Cloud
    pkgs.awscli2
    pkgs.terraform
    pkgs.terraform-ls
    pkgs.terraform-docs

    ## Docker & K8s
    pkgs.podman-tui
    pkgs.kubectl
    pkgs.eksctl
    pkgs.kubernetes-helm
    pkgs.helmfile
  ];

  programs = {
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
    emacs.enable = true;
  };
}
