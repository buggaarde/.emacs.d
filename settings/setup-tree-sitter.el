(use-package tree-sitter
  :straight (tree-sitter :host github :repo "emacs-tree-sitter/elisp-tree-sitter"
			 :fork (:host github :repo "buggaarde/elisp-tree-sitter"))
  :defer 10
  :init
  (use-package tree-sitter-langs
	:straight t)
  
  :config (global-tree-sitter-mode)

  :hook (tree-sitter-mode . tree-sitter-hl-mode))

(provide 'setup-tree-sitter)
