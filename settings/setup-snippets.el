(use-package yasnippet
  :straight t
  :defer t
  :diminish yas-minor-mode

  :config
  (setq yas-snippet-dirs '("~/.emacs.d/snippets/"))
  (setq yas-prompt-functions '(yas-ido-prompt yas-completing-prompt))
  (setq yas-verbosity 1)
  ;; (yas-global-mode t)

  :hook (prog-mode . yas-minor-mode))

(provide 'setup-snippets)
