(use-package rust-mode
  :ensure t
  :init
  (setq rust-format-on_save t)
  
  :hook
  (rust-mode . (lambda () (setq indent-tabs-mode nil))))
