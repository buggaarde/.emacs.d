(use-package elm-mode
  :straight t
  :custom
  (elm-sort-imports-on-save t)
  
  :config
  (add-to-list 'company-backends 'company-elm)

  :hook
  (elm-mode . elm-format-on-save-mode))


(provide 'setup-elm)
