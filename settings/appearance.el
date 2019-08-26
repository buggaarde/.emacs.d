;; ;; Set color theme
;; (set-background-color "black")
;; (set-foreground-color "white")
;; (set-face-background 'region "#464740")
;; (set-face-background 'highlight "#111111")
;; (set-face-background 'show-paren-match "#333399")
;; (set-face-background 'show-paren-mismatch "red")

;; (use-package spacemacs-common
;;   :ensure spacemacs-theme
;;   :config (load-theme 'spacemacs-light t))

;; (use-package basic-theme
;;   :ensure t
;;   :config
;;   (load-theme 'basic))

;; (use-package minimal-theme
;;   :ensure t
;;   :config
;;   (load-theme 'minimal-light))

(use-package greymatters-theme
  :ensure t
  :config (load-theme 'greymatters))

;; Set fonts
;; (set-face-attribute 'default nil :font "Monaco" :height 140)
(require 'fira-code-mode)
(set-face-attribute 'default nil :font "Fira Code" :height 140)
(use-package fira-code-mode
  :diminish fira-code-mode
  :hook (prog-mode . fira-code-mode))
;; (set-face-attribute 'default nil :font "Bookerly" :height 150)

;; Load Powerline
(require 'setup-powerline)

(provide 'appearance)
