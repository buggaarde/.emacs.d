(use-package evil-cleverparens
  :after evil-mode
  :straight t
  :config (setq evil-move-beyond-eol t)
  :hook (prog-mode . evil-cleverparens-mode))

(provide 'setup-evil-cleverparens)
