(use-package auto-complete
  :config
  (add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
  (ac-set-trigger-key "TAB")
  (ac-set-trigger-key "<tab>")
  
  :diminish auto-complete-mode)

(use-package auto-complete-config
  :config
  (ac-config-default))

(provide 'setup-autocomplete)
