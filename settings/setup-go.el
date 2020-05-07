;; -*- lexical-binding: t; -*-

(use-package go-mode
  :straight t
  :defer t

  :init
  (setenv "GOPATH" "/Users/simonbuggesiggaard/go")

  :config
  (add-to-list 'exec-path (concat (getenv "GOPATH") "/src/github.com/nsf/gocode"))
  
  (setq gofmt-command (concat (getenv "GOPATH") "/bin/goimports"))
  (setq godef-command (concat (getenv "GOPATH") "/bin/godef"))
  ;; (setq godef-command (concat (getenv "GOPATH") "/bin/misspell"))
  ;; (setq godef-command (concat (getenv "GOPATH") "/bin/golint"))

  (add-hook 'go-mode-hook '(lambda ()
							 (add-hook 'before-save-hook 'gofmt-before-save)))
  (add-hook 'flycheck-mode-hook '(lambda ()
								   (add-to-list 'flycheck-checkers 'go-golint)))

  (use-package go-autocomplete
	:load-path  "/Users/simonbuggesiggaard/go/src/github.com/nsf/gocode/emacs")
  
  :bind (:map go-mode-map
			  ("C-." . 'godef-jump)
			  ("C-:" . 'godef-jump-other-window)
			  ("C-," . 'pop-tag-mark)))

(use-package flycheck-golangci-lint
  :straight t
  :hook (go-mode . flycheck-golangci-lint-setup))

;; define custom functions for option-snippet
(require 'setup-go-misc)

(provide 'setup-go)
