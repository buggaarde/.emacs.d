(use-package lsp-mode
  :straight t
  :defer t
  :custom
  (lsp-prefer-flymake nil)
  
  :config
  (use-package lsp-ui
  	:straight t
	:defer t
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
				("C-c d" . ladicle/toggle-lsp-ui-doc)))

  ;; (use-package company-lsp
  ;; 	:ensure t
  ;; 	:hook (lsp-mode . company-lsp))
  
  :hook (prog-mode . lsp)
  :commands lsp)

(provide 'setup-lsp)
