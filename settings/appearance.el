;; Set color theme
(set-background-color "black")
(set-foreground-color "white")
(set-face-background 'region "#464740")
(set-face-background 'highlight "#111111")
(set-face-background 'show-paren-match "#333399")
(set-face-background 'show-paren-mismatch "red")

;; Set fonts
(set-face-attribute 'default nil :font "Monaco" :height 150)
;; (require 'fira-code-mode)
;; (use-package fira-code-mode
;;   :diminish fira-code-mode
;;   :hook (prog-mode . fira-code-mode))

;; Load Powerline
(require 'setup-powerline)

(provide 'appearance)
