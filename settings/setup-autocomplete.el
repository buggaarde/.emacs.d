;; -*- lexical-binding: t; -*-

(use-package company
  :straight t
  :defer t
  :init
  (setq company-backends
		'(company-capf))
  :config
  (setq company-minimum-prefix-length 1
      company-idle-delay 0.0))

(provide 'setup-autocomplete)
