(use-package projectile
  :ensure t
  :diminish
  :after ivy
  :config
  (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  
  (projectile-mode 1)

  (use-package counsel-projectile
	:ensure t
	:diminish counsel
	:config
	(counsel-mode 1)
	(counsel-projectile-mode)))

(provide 'setup-projectile)
