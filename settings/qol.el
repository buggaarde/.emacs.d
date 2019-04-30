;; Attempt to split horizontally a bit more
(setq split-height-threshold nil)
(setq split-width-threshold 0)

;; Set default tab width to 4 spaces
(setq-default tab-width 4)

;; We want the current line to be highlighted, but only in the selected buffer
(global-hl-line-mode 1)
(setq global-hl-line-sticky-flag nil)

;; Make the cursor a line instead of a block
(setq-default cursor-type 'bar)

;; Stops the cursor from blinking
(blink-cursor-mode -1)

;; Delete selections by just typing
(delete-selection-mode 1)

;; Just hit 'y' or 'n' instead of typing "yes" or "no" every time
(defalias 'yes-or-no-p 'y-or-n-p)

;; Uniquify buffer names
'(uniquify-buffer-name-style
  (quote post-forward) nil (uniquify))

;; Treat sub-words as individual words
(use-package subword
  :ensure t
  :defer t
  :config
  (add-hook 'prog-mode-hook 'subword-mode))

;; Better window switching
(use-package ace-window
  :ensure t
  :defer t
  :bind (("C-x o" . ace-window))
  :config
  (setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l)))

;; Avy jump mode
(use-package avy
  :ensure t
  :bind (("C-ø" . avy-goto-subword-1)))

(provide 'qol)
