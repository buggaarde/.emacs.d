(use-package go-mode
  :ensure t
  :defer t

  :init
  (setenv "GOPATH" "/Users/simonbuggesiggaard/go")

  :config
  (add-to-list 'exec-path (concat (getenv "GOPATH") "/src/github.com/nsf/gocode"))
  (setq gofmt-command (concat (getenv "GOPATH") "/bin/goimports"))
  (setq godef-command (concat (getenv "GOPATH") "/bin/godef"))

  (add-hook 'go-mode-hook '(lambda ()
							 (add-hook 'before-save-hook 'gofmt-before-save)))

  (use-package go-autocomplete
	:load-path  "/Users/simonbuggesiggaard/go/src/github.com/nsf/gocode/emacs")
  
  :bind (:map go-mode-map
			  ("C-." . 'godef-jump)
			  ("C-:" . 'godef-jump-other-window)
			  ("C-," . 'pop-tag-mark)))

(use-package flycheck-golangci-lint
  :ensure t
  :defer t
  :hook (go-mode . flycheck-golangci-lint-setup))

;; define custom functions for option-snippet
(require 'setup-go-misc)

(provide 'setup-go)
