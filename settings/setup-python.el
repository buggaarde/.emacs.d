;; -*- lexical-binding: t; -*-

;; (use-package elpy
;;   :straight t
;;   :defer t

;;   :init
  

;;   (setq flycheck-python-pycompile-executable "python3")

;;   :config
;;   (add-hook 'elpy-mode-hook '(lambda () (jedi:setup)))
;;   (add-hook 'elpy-mode-hook '(lambda () (jedi:ac-setup)))
;;   (add-hook 'elpy-mode-hook 'importmagic-mode)
;;   (add-hook 'elpy-mode-hook 'blacken-mode)
;;   (add-hook 'elpy-mode-hook '(lambda () (highlight-indentation-mode -1)))
;;   ;; ((elpy-mode  (highlight-indentation-mode -1))
;;   ;;  (elpy-mode py-yapf-enable-on-save)
;;   ;;  (elpy-mode jedi:setup)
;;   ;;  (elpy-mode jedi:ac-setup)
;;   ;;  (elpy-mode importmagic-mode)
;;   ;;  (elpy-mode blacken-mode))

;;   (when (require 'flycheck nil t)
;; 	(setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
;; 	(add-hook 'elpy-mode-hook 'flycheck-mode))
;;   (elpy-enable)
  
;;   :bind (:map elpy-mode-map
;; 			  ("C-." . 'jedi:goto-definition)
;; 			  ("C-," . 'jedi:goto-definition-pop-marker)))

(use-package lsp-python-ms
  :straight t
  :init
  (use-package lsp-python-ms
	:straight t
	:config
	(setq lsp-python-ms-auto-install-server t))

  (use-package blacken
	:straight t
	:defer t)

  (use-package importmagic
	:straight t
	:defer t
	:config
	(setq importmagic-python-interpreter "python3"))


  :hook ((python-mode . (lambda () (require 'lsp-python-ms) (lsp-deferred)))
		 (python-mode . blacken-mode)
		 (python-mode . importmagic-mode)))

(provide 'setup-python)
