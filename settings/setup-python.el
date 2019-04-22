(use-package elpy
  :ensure t
  :defer t

  :init
  (use-package py-yapf
	:ensure t
	:defer t)

  (use-package importmagic
	:ensure t
	:config
	(setq importmagic-python-interpreter "python3"))

  (setq flycheck-python-pycompile-executable "python3")

  :config
  (when (require 'flycheck nil t)
	(setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
	(add-hook 'elpy-mode-hook 'flycheck-mode))

  (add-hook 'elpy-mode-hook '(lambda () (progn
									 (highlight-indentation-mode -1)
									 (py-yapf-enable-on-save)
									 (jedi:setup)
									 (jedi:ac-setup)
									 (importmagic-mode))))

  (elpy-enable)

  :bind (:map elpy-mode-map
			  ("C-." . 'jedi:goto-definition)
			  ("C-," . 'jedi:goto-definition-pop-marker)))

(provide 'setup-python)
