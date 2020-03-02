(use-package haskell-mode
  :straight (haskell-mode :type git :host github :repo "haskell/haskell-mode")
  :defer t

  :config
  (use-package lsp-haskell
	:straight (lsp-haskell :type git :host github :repo "emacs-lsp/lsp-haskell")
	:defer t)

  (require 'lsp)
  (require 'lsp-haskell)
  (add-hook 'haskell-mode-hook #'lsp)
  
  (setq haskell-stylish-on-save t)
  (setq haskell-mode-stylish-haskell-path "brittany"))

(provide 'setup-haskell)
