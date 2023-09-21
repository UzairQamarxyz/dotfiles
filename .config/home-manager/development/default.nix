{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    # Development
    ## Misc.
    nodejs
    libtool
    git
    ripgrep
    coreutils
    fd
    slack
    shellcheck
    gore
    gotools
    gopls
    gomodifytags
    gotests
    black
    isort
    pipenv
    shfmt
    python311Packages.cfn-lint
    python311Packages.grip
    python311Packages.pyflakes
    python311Packages.pyflakes
    python311Packages.nose
    pre-commit
    nixfmt
    terraform-ls
    terraform-docs
    tflint
    haskell-language-server
    haskellPackages.hoogle
    stylish-haskell
    go

    ## Python
    python3Full

    ## Cloud
    awscli2
    terraform

    ## Docker & K8s
    podman-tui
    kubectl
    eksctl
    kubernetes-helm
    helmfile
  ];

  programs = {
    go = {
      enable = true;
      goPath = "go";
      goBin = ".local/go";
    };
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

  services = { emacs.enable = true; };
}
