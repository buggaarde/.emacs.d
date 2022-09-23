;; -*- lexical-binding: t; -*-

(use-package clojure-mode
  :straight t
  :defer t

  :config
  (use-package cider
	:straight t))

(provide 'setup-clojure)
