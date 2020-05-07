;; -*- lexical-binding: t; -*-

(use-package evil
  :ensure t
  :init
  
  ;; Set up keybindings for evil-mode with <SPC> as leader key
  (use-package evil-leader
    :ensure t
    :config
    (global-evil-leader-mode)
    (evil-leader/set-leader "<SPC>")
	(require 'setup-evil-global)
	(require 'setup-evil-go))

  (evil-mode 1)
  ;; Make movement keys work like they should
  (define-key evil-normal-state-map (kbd "<remap> <evil-next-line>") 'evil-next-visual-line)
  (define-key evil-normal-state-map (kbd "<remap> <evil-previous-line>") 'evil-previous-visual-line)
  (define-key evil-motion-state-map (kbd "<remap> <evil-next-line>") 'evil-next-visual-line)
  (define-key evil-motion-state-map (kbd "<remap> <evil-previous-line>") 'evil-previous-visual-line)

  ;; Make horizontal movement cross lines
  (setq-default evil-cross-lines t)

  (use-package evil-surround
    :ensure t
    :config
    (global-evil-surround-mode 1))
  
  (use-package evil-indent-textobject
    :ensure t)

  (use-package evil-multiedit
	:ensure t
	:config
	(evil-multiedit-default-keybinds)))



(provide 'setup-evil)
