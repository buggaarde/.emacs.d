;; -*- lexical-binding: t; -*-

(use-package multiple-cursors
  :straight t
  :bind (("C-d" . mc/mark-next-word-like-this)
		 ("C-S-d" . mc/mark-all-words-like-this)))

(provide 'setup-multiple-cursors)
