(use-package elpy
  :ensure t

  :init
  (add-to-list 'load-path (expand-file-name "~/.emacs.d/sitelisp/blacken/"))
  (require 'blacken)
  
  (use-package importmagic
	:ensure t
	:config
	(setq importmagic-python-interpreter "python3"))

  (setq flycheck-python-pycompile-executable "python3")

  :config
  (add-hook 'elpy-mode-hook '(lambda () (jedi:setup)))
  (add-hook 'elpy-mode-hook '(lambda () (jedi:ac-setup)))
  (add-hook 'elpy-mode-hook 'importmagic-mode)
  (add-hook 'elpy-mode-hook 'blacken-mode)
  ;; ((elpy-mode  (highlight-indentation-mode -1))
  ;;  (elpy-mode py-yapf-enable-on-save)
  ;;  (elpy-mode jedi:setup)
  ;;  (elpy-mode jedi:ac-setup)
  ;;  (elpy-mode importmagic-mode)
  ;;  (elpy-mode blacken-mode))

  (when (require 'flycheck nil t)
	(setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
	(add-hook 'elpy-mode-hook 'flycheck-mode))
  (elpy-enable)
  
  :bind (:map elpy-mode-map
			  ("C-." . 'jedi:goto-definition)
			  ("C-," . 'jedi:goto-definition-pop-marker)))

(provide 'setup-python)
