(use-package diff-hl
  :ensure t
  :config (global-diff-hl-mode)
  :hook (magit-post-refresh . diff-hl-magit-post-refresh))

(provide 'setup-diff-hl)