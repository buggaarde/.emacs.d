(use-package tree-sitter
  :straight t
  :init
  (use-package tree-sitter-langs
	:straight t)
  :config
  (global-tree-sitter-mode))

(provide 'setup-tree-sitter)
