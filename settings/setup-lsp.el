;; -*- lexical-binding: t; -*-

(use-package lsp-mode
  :straight t
  :custom
  (lsp-prefer-flymake nil)
  (lsp-rust-analyzer-cargo-watch-command "clippy")
  (lsp-eldoc-render-all t)
  
  :config
  (use-package lsp-ui
  	:straight t
	:custom
	(lsp-ui-doc-delay 1.2)
	(lsp-ui-doc-enable t)
	(lsp-ui-doc-position 'at-point)
	;; (lsp-ui-flycheck-enable t)
	(lsp-ui-sideline-enable nil)

	:preface
	(defun ladicle/toggle-lsp-ui-doc ()
      (interactive)
      (if lsp-ui-doc-mode
          (progn
			(lsp-ui-doc-mode -1)
			(lsp-ui-doc--hide-frame))
        (lsp-ui-doc-mode 1)))

	:bind (:map lsp-mode-map
				("C-c d" . ladicle/toggle-lsp-ui-doc))
	
	:commands lsp-ui-mode)

  
  ;; Set up before-save hooks to format buffer and add/delete imports.
  ;; Make sure you don't have other gofmt/goimports hooks enabled.
  (defun lsp-go-install-save-hooks ()
  	(add-hook 'before-save-hook #'lsp-format-buffer t t)
  	(add-hook 'before-save-hook #'lsp-organize-imports t t))
  
  :hook ((go-mode . lsp-deferred)
		 (go-mode . lsp-go-install-save-hooks)
		 (c++-mode . lsp-deferred)
		 (rust-mode . lsp-deferred))
  
  :bind (("C-." . 'lsp-find-definition))
  
  :commands (lsp lsp-deferred))

(provide 'setup-lsp)
