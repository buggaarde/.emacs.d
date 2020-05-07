;; -*- lexical-binding: t; -*-

;; (use-package doom-themes
;;   :straight t

;;   :config
;;   (setq doom-themes-enable-bold t
;; 		doom-themes-enable-italic t)

;;   (load-theme 'doom-nord))

(use-package white-sand-theme
  :straight (white-sand-theme
			 :type git :host github
			 :repo "mswift42/white-sand-theme")
  :config (load-theme 'white-sand))

;; Set fonts
;; (set-face-attribute 'default nil :font "Source Code Pro" :height 150)
(require 'fira-code-mode)
(set-face-attribute 'default nil :font "Fira Code" :height 150)
(use-package fira-code-mode
  :diminish fira-code-mode
  :hook (prog-mode . fira-code-mode))
;; (set-face-attribute 'default nil :font "Bookerly" :height 150)

;; Load Powerline
;; (require 'setup-powerline)

(provide 'appearance)
