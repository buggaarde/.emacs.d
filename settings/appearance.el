(use-package doom-themes
  :straight t

  :config
  (setq doom-themes-enable-bold t
		doom-themes-enable-italic t)

  (load-theme 'doom-nord-light))

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
