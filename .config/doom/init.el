;;; init.el -*- lexical-binding: t; -*-

(doom! :input

       :completion
       (company +childframe)
       (ivy +childframe +icons +childframe +prescient)

       :ui
       deft
       doom
       doom-dashboard
       (emoji +unicode)
       hl-todo
       indent-guides
       (ligatures +iosevka)
       modeline
       nav-flash
       ophints
       (popup +defaults)
       (treemacs + lsp)
       unicode
       (vc-gutter +pretty)
       vi-tilde-fringe
       (window-select +numbers)
       workspaces
       zen

       :editor
       (evil +everywhere)
       file-templates
       fold
       (format +onsave)
       rotate-text
       snippets
       word-wrap

       :emacs
       (dired +icons +ranger)
       electric
       (ibuffer +icons)
       undo
       vc

       :term
       vterm

       :checkers
       syntax
       (spell +flyspell)
       grammar

       :tools
       (docker +lsp)
       editorconfig
       (eval +overlay)
       (lookup +dictionary +offline)
       (lsp +peek)
       magit
       make
       pdf
       rgb
       taskrunner
       terraform
       tree-sitter
       upload

       :os
       (:if IS-MAC macos)
       tty

       :lang
       data
       emacs-lisp
       (go +lsp +tree-sitter)
       (json +lsp +tree-sitter)
       (javascript +lsp +tree-sitter)
       (lua +lsp +tree-sitter)
       (markdown +grip)
       ;; (nix +tree-sitter)
       (org +roam2 +pretty +present +noter +hugo +gnuplot +brain)
       (python +lsp +tree-sitter +pyright +pyenv)
       (rust +lsp +tree-sitter)
       (sh +lsp +tree-sitter)
       (web +lsp +tree-sitter)
       (yaml +lsp)

       :config
       (default +bindings +smartparens))
