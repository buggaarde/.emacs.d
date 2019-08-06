(use-package spaceline  
  :ensure t
  :init
  (progn
	(require 'spaceline-config)
	(setq spaceline-workspace-numbers-unicode t)
	(setq spaceline-separator-dir-left '(left . left))
	(setq spaceline-separator-dir-right '(right . right))
	(setq powerline-height 13)
	;;(spaceline-toggle-window-number-on)
	(spaceline-toggle-buffer-modified-on)
	(spaceline-toggle-major-mode-on)
	;;(spaceline-toggle-hud-on)
	(spaceline-toggle-projectile-root-on)
	(spaceline-emacs-theme)))

(provide 'setup-powerline)
