(use-package paredit
  :ensure t
  :defer t
  :hook ((emacs-lisp-mode . enable-paredit-mode)
		 (clojure-mode . enable-paredit-mode)
		 (lisp-mode . enable-paredit-mode)
		 (cider-mode . enable-paredit-mode)))

(provide 'setup-paredit)
