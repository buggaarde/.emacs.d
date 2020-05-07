;; -*- lexical-binding: t; -*-

(use-package writeroom-mode
  :defer t
  :straight t)

(defun activate-write ()
	(when (and (stringp buffer-file-name)
			   (string-match "\\whengodsdie.org\\'" buffer-file-name))
	  (progn (writeroom-mode)
			 (writegood-mode)
			 (visual-line-mode)
			 (flyspell-mode))))

(use-package writegood-mode
  :straight t
  :defer t
  :after writeroom-mode 

  :bind (:map visual-line-mode-map
			  ("C-a" . beginning-of-visual-line))

  :hook ((find-file . activate-write)))

(provide 'setup-writing)
