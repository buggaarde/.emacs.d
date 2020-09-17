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

;; (use-package ivy-posframe
;;   :straight (ivy-posframe
;; 			 :type git :host github
;; 			 :repo "tumashu/ivy-posframe")
;;   :init
;;   (setq ivy-posframe-display-functions-alist
;; 		'((swiper            . ivy-display-function-fallback)
;; 		  (counsel-find-file . ivy-posframe-display-at-frame-top-center)
;; 		  (ivy-switch-buffer . ivy-posframe-display-at-frame-top-center)
;;           (counsel-M-x       . ivy-posframe-display-at-frame-top-center)))
;;   (ivy-posframe-mode 1)
;;  )										;

(provide 'setup-ivy)
