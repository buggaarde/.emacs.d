(use-package doom-modeline
  :straight t
  :init (doom-modeline-mode 1)
  :config (setq doom-modeline-buffer-file-name-style 'relative-from-project))

(provide 'setup-doom-modeline)
