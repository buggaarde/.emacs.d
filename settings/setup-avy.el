(use-package avy
  :straight t

  :config
  (setq avy-keys '(?e ?h ?t ?i ?a ?n))
  :bind ("C-:" . avy-goto-char-timer))

(provide 'setup-avy)
