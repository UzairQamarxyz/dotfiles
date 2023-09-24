;; -*- no-byte-compile: t; -*-
;;; $DOOMDIR/packages.el

(package! kanagawa-nvim
  :recipe (:host github :repo "rebelot/kanagawa.nvim"
                 :files ("extras/*.el")))
