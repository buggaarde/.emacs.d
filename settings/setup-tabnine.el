;; -*- lexical-binding: t; -*-

(use-package company
  :straight t
  :config
  ;; Trigger completion immediately.
  (setq company-idle-delay 0)

  ;; Number the candidates (use M-1, M-2 etc to select completions).
  (setq company-show-numbers t)

  ;; Use the tab-and-go frontend.
  ;; Allows TAB to select and complete at the same time.
  (company-tng-configure-default)
  (setq company-frontends
		'(company-tng-frontend
          company-pseudo-tooltip-frontend
          company-echo-metadata-frontend)))

(use-package company-tabnine
  :straight t
  :after company
  :init
  (add-to-list 'company-backends #'company-tabnine)
  (add-to-list 'company-backends #'company-c-headers))

(provide 'setup-tabnine)
