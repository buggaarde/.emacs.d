;; -*- lexical-binding: t; -*-

(use-package ivy
  :straight t
  :diminish ivy-mode

  :init
  (use-package flx
	:defer t
	:straight t)

  :config
  (ivy-mode 1)

  (setq ivy-use-virtual-buffers t)
  (setq ivy-virtual-abbreviate 'full)

  ;; (setq ivy-re-builders-alist
  ;; 		'((ivy-switch-buffer . ivy--regex-plus)
  ;; 		  (t . ivy--regex-fuzzy)))

  (use-package counsel
	:straight t
	:bind (("C-s" . swiper)
		   ("M-x" . counsel-M-x))))

(provide 'setup-ivy)
