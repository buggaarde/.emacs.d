;; -*- lexical-binding: t; -*-

(use-package go-mode
  :straight t

  :init
  (setenv "GOPATH" "/home/siggaard/go")

  :config
  (add-to-list 'exec-path (concat (getenv "GOPATH") "/src/github.com/nsf/gocode"))
  
  (setq gofmt-command (concat (getenv "GOPATH") "/bin/goimports"))
  (setq godef-command (concat (getenv "GOPATH") "/bin/godef"))
  ;; (setq godef-command (concat (getenv "GOPATH") "/bin/misspell"))
  ;; (setq godef-command (concat (getenv "GOPATH") "/bin/golint"))

  ;; (add-hook
  ;;  'go-mode-hook
  ;;  (lambda () (add-hook 'before-save-hook 'gofmt-before-save)))
  
  ;; (add-hook
  ;;  'flycheck-mode-hook
  ;;  (lambda () (add-to-list 'flycheck-checkers 'go-golint)))

  ;; (use-package go-autocomplete
  ;; 	:load-path  "/home/siggaard/go/src/github.com/nsf/gocode/emacs")
  )

(use-package flycheck-golangci-lint
  :straight t
  :hook (go-mode . flycheck-golangci-lint-setup))

;; define custom functions for option-snippet
(require 'setup-go-misc)

(provide 'setup-go)
