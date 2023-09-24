;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Font
(setq doom-font (font-spec :family "IosevkaCustom Nerd Font" :size 14)
     doom-variable-pitch-font (font-spec :family "NotoSans Nerd Font" :size 13))

;; Theme
(setq doom-theme 'kanagawa)

;; Numberline
(setq display-line-numbers-type 'relative)

;; Org-mode
(setq org-directory "~/org/")

;; Set Transparency
(set-frame-parameter (selected-frame) 'alpha '(90 90))
(add-to-list 'default-frame-alist '(alpha 90 90))
(setq org-hide-emphasis-markers t)

;; Set fringe style
(set-fringe-mode 0)

;; Terraform config
(use-package lsp-mode
  :ensure t
  :hook ((terraform-mode . lsp-deferred)))
(setq lsp-disabled-clients '(tfls))
(setq lsp-terraform-ls-enable-show-reference t)

Ignore .terraform folders
(with-eval-after-load 'lsp-mode
  (add-to-list 'lsp-file-watch-ignored-directories "[/\\\\]\\.terraform\\'")


;; Cfn-Lint
(define-derived-mode cfn-yaml-mode yaml-mode
  "CFN-YAML"
  "Simple mode to edit CloudFormation template in YAML format.")

(add-to-list 'magic-mode-alist
             '("\\(---\n\\)?AWSTemplateFormatVersion:" . cfn-yaml-mode))

;; Set up cfn-lint integration if flycheck is installed
;; Get flycheck here https://www.flycheck.org/
(when (featurep 'flycheck)
  (flycheck-define-checker cfn-lint
    "AWS CloudFormation linter using cfn-lint.

Install cfn-lint first: pip install cfn-lint

See `https://github.com/aws-cloudformation/cfn-python-lint'."

    :command ("cfn-lint" "-f" "parseable" source)
    :error-patterns ((warning line-start (file-name) ":" line ":" column
                              ":" (one-or-more digit) ":" (one-or-more digit) ":"
                              (id "W" (one-or-more digit)) ":" (message) line-end)
                     (error line-start (file-name) ":" line ":" column
                            ":" (one-or-more digit) ":" (one-or-more digit) ":"
                            (id "E" (one-or-more digit)) ":" (message) line-end))
    :modes (cfn-json-mode cfn-yaml-mode))

  (add-to-list 'flycheck-checkers 'cfn-lint)
  (add-hook 'cfn-json-mode-hook 'flycheck-mode)
  (add-hook 'cfn-yaml-mode-hook 'flycheck-mode))

(setq fancy-splash-image "/home/uzair/Pictures/vectors/wallpaper.png")
