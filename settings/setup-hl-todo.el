;; -*- lexical-binding: t; -*-

(use-package hl-todo
  :straight t
  :diminish t
  :config
  (setq hl-todo-keyword-faces
   (append hl-todo-keyword-faces '(("DEFERRED" . "#cc9393"))))

  :hook (prog-mode . hl-todo-mode))

(provide 'setup-hl-todo)
