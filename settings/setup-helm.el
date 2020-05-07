;; -*- lexical-binding: t; -*-

(use-package helm
  :straight t
  :diminish helm-mode
  :config
  (require 'helm-config)
  (helm-mode 1)

  (helm-autoresize-mode 1)
  (setq helm-auto-resize-max-height 38)
  (setq helm-split-window-in-side-p t)
  (setq helm-M-x-fuzzy-match t)
  
  :bind (("C-x C-f" . helm-find-files)
		 ("C-x b" . helm-mini)
		 ("M-x" . helm-M-x)
		 ("M-y" . helm-show-kill-ring)
		 :map helm-map
			  ("<tab>" . helm-execute-persistent-action)
			  ("C-i" . helm-execute-persistent-action)
			  ("C-z" . helm-select-action)))

(provide 'setup-helm)
