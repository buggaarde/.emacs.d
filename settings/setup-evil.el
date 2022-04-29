;; -*- lexical-binding: t; -*-

(use-package evil
  :straight t
  :init
  
  ;; Set up keybindings for evil-mode with <SPC> as leader key
  (use-package evil-leader
    :straight t
    :config
    (global-evil-leader-mode)
    (evil-leader/set-leader "<SPC>")
	(require 'setup-evil-global)
	(require 'setup-evil-go)
	(require 'setup-evil-rust))

  (evil-mode 1)
  
  ;; rebind j and k to up and down, respectively.
  (define-key evil-motion-state-map "j" 'evil-previous-line)
  (define-key evil-motion-state-map "k" 'evil-next-line)

  ;; Provide a toggle for when I'm not using my custom keyboard
  (defun siggaard/swap-evil-j-and-k ()
	(interactive)
	(let ((j (lookup-key evil-motion-state-map "j"))
		  (k (lookup-key evil-motion-state-map "k")))
	  (define-key evil-motion-state-map "j" k)
	  (define-key evil-motion-state-map "k" j)))
  
  ;; make evil movement commands act on visual lines.
  (define-key evil-normal-state-map (kbd "<remap> <evil-next-line>") 'evil-next-visual-line)
  (define-key evil-normal-state-map (kbd "<remap> <evil-previous-line>") 'evil-previous-visual-line)
  (define-key evil-motion-state-map (kbd "<remap> <evil-next-line>") 'evil-next-visual-line)
  (define-key evil-motion-state-map (kbd "<remap> <evil-previous-line>") 'evil-previous-visual-line)

  ;; Make horizontal movement cross lines
  (setq-default evil-cross-lines t)

  (use-package evil-surround
    :straight t
    :config
    (global-evil-surround-mode 1))
  
  (use-package evil-indent-textobject
    :straight t)

  (use-package evil-multiedit
	:straight t
	:config
	(evil-multiedit-default-keybinds))

  (use-package undo-tree
	:straight t
	:config (global-undo-tree-mode)
	(setq undo-tree-history-directory-alist '(("." . "~/.emacs.d/undo"))))

  :config
  (evil-set-undo-system 'undo-tree))




(provide 'setup-evil)
