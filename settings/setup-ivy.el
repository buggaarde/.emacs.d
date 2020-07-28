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

  (use-package counsel
	:straight t
	:bind (("C-s" . swiper)
		   ("M-x" . counsel-M-x)
		   ("C-x C-f" . counsel-find-file)
		   ("C-c C-r" . ivy-resume))))

(provide 'setup-ivy)
