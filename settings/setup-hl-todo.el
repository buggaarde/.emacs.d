;; -*- lexical-binding: t; -*-

(use-package hl-todo
  :straight t
  :diminish t
  :config
  (setq hl-todo-keyword-faces
		(append hl-todo-keyword-faces '(("DEFERRED" . "#cc9393")
										("FIX" . "#cc9393")
										("DECISION" . "#ff69b4"))))

  :hook (prog-mode . hl-todo-mode))

(provide 'setup-hl-todo)
