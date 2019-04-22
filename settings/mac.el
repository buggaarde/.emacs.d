(if (eq system-type 'darwin)
    (progn
      (setq default-input-method "MacOSX")
      (setq mac-option-modifier 'super)
      (setq mac-command-modifier 'meta)
      (setq ns-function-modifier 'hyper)
      (define-key key-translation-map (kbd "s-8") (kbd "["))
      (define-key key-translation-map (kbd "s-(") (kbd "{"))
      (define-key key-translation-map (kbd "s-9") (kbd "]"))
      (define-key key-translation-map (kbd "s-)") (kbd "}"))
      (define-key key-translation-map (kbd "s-7") (kbd "|"))
      (define-key key-translation-map (kbd "s-/") (kbd "\\"))
      (define-key key-translation-map (kbd "s-'") (kbd "@"))
      (define-key key-translation-map (kbd "M-s-7") (kbd "M-|"))))

(if (eq system-type 'darwin)
    (progn
      (unless (package-installed-p 'exec-path-from-shell)
	(package-install 'exec-path-from-shell))
      (exec-path-from-shell-initialize)))  

(provide 'mac)
