;; -*- lexical-binding: t; -*-

;; (use-package white-sand-theme
;;   :straight (white-sand-theme
;; 			 :type git :host github
;; 			 :repo "mswift42/white-sand-theme")
;;   :config (load-theme 'white-sand))


(use-package doom-themes
  :straight t
  :config
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t) ; if nil, italics is universally disabled
  (load-theme 'doom-tomorrow-night t)
  
  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config))

;; Set fonts
;; (set-face-attribute 'default nil :font "Source Code Pro" :height 150)
(set-face-attribute 'default nil :font "JetBrains Mono" :height 130)
(require 'jetbrains-mono-mode)
(add-hook 'prog-mode-hook jetbrains-ligature-mode)
;; (require 'fira-code-mode)
;; (set-face-attribute 'default nil :font "Fira Code" :height 150)
;; (use-package fira-code-mode
;;   :diminish fira-code-mode
;;   :hook (prog-mode . fira-code-mode))

(provide 'appearance)
