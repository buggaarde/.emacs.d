(use-package drag-stuff
  :straight (drag-stuff
			 :type git :host github
			 :repo "rejeep/drag-stuff.el")
  :config
  (drag-stuff-define-keys)
  (drag-stuff-global-mode 1))

(provide 'setup-drag-stuff)
