;; -*- lexical-binding: t; -*-

;; (use-package white-sand-theme
;;   :straight (white-sand-theme
;; 			 :type git :host github
;; 			 :repo "mswift42/white-sand-theme")
;;   :config (load-theme 'white-sand))

;; ;; the cursor in default white-sand is too similar to the hl-line color, so we make it slightly darker.
;; (set-cursor-color "#999999")

;; (use-package eink-theme
;;   :straight (eink-theme
;; 			 :type git :host github
;; 			 :repo "maio/eink-emacs")
;;   :config (load-theme 'eink))

;; Use tree-sitter for syntax highlighting whereever available
(require 'setup-tree-sitter)

(use-package doom-themes
  :straight t
  :config
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold nil
        doom-themes-enable-italic nil)
  ;; doom-gruvbox-brighter-comments t
  (load-theme 'doom-one t)
  
  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config))

;; (use-package twilight-theme
;;   :straight t
;;   :config
;;   (load-theme 'twilight))

;; (use-package jetbrains-darcula-theme
;;   :straight (darcula-theme
;; 	     :type git :host github
;; 	     :repo "ianpan870102/jetbrains-darcula-emacs-theme")
;;   :config
;;   (load-theme 'jetbrains-darcula t))

(set-face-attribute 'default nil :font "JetBrains Mono" :height 200)
;; (require 'jetbrains-mono-mode)

(provide 'appearance)
