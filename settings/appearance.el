;; -*- lexical-binding: t; -*-

;; Use tree-sitter for syntax highlighting whereever available
(require 'setup-tree-sitter)

(use-package doom-themes
  :straight t
  :config
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold nil
        doom-themes-enable-italic nil
		doom-one-brighter-comments nil)
  ;; (load-theme 'doom-gruvbox-light t)
  (load-theme 'doom-nord-light t)
  ;; (load-theme 'doom-one t)
  ;; (load-theme 'doom-homage-white t)
  ;; (load-theme 'doom-flatwhite t)
  ;; (load-theme 'doom-meltbus t)
  
  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config))

(set-face-attribute 'default nil :font "JetBrains Mono" :height 220)
;; (set-face-attribute 'default nil :font "Berkeley Mono Trial" :height 220)

; (require 'jetbrains-mono-mode)

(provide 'appearance)
