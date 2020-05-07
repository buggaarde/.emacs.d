;; -*- lexical-binding: t; -*-

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

(use-package exec-path-from-shell
  :straight (exec-path-from-shell :type git :host github :repo "purcell/exec-path-from-shell"))

;; (if (eq system-type 'darwin) 
;; 	(exec-path-from-shell-initialize))  

(provide 'mac)










