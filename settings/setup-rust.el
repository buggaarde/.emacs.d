;; -*- lexical-binding: t; -*-

(use-package rust-mode
  :straight t
  :config
  (setq rust-format-on-save t)
  
  :hook
  (rust-mode . (lambda () (setq indent-tabs-mode nil))))

(provide 'setup-rust)
