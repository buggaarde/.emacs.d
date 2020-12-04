;; -*- lexical-binding: t; -*-

;; Increase GC threshold temporarily, while init.el loads
(setq gc-cons-threshold most-positive-fixnum ; 2^61 bytes
      gc-cons-percentage 0.6)

(add-hook 'emacs-startup-hook
		  (lambda ()
			(setq gc-cons-threshold 16777216 ; 16mb
				  gc-cons-percentage 0.1)))

;; Remove toolbar, menu bar and scroll bar
(when window-system
  (tooltip-mode -1)
  (tool-bar-mode -1)
  (menu-bar-mode -1)
  (scroll-bar-mode -1))

;; Remove splash screen
(setq inhibit-splash-screen t)

;; Start Emacs in full-screen on second monitor, if there
;; (setq workarea (cdr (assoc 'workarea (nth 0 (last (display-monitor-attributes-list))))))
;; (setq width-offset (nth 0 workarea))
;; (setq height-offset (nth 1 workarea))

;; (setq default-frame-alist `((top + ,height-offset) (left + ,width-offset)))

(custom-set-variables
 '(initial-frame-alist '((fullscreen . maximized))))


;; Set path to dependencies
(setq settings-dir
      (expand-file-name "settings" user-emacs-directory))

;; Set up load path
(add-to-list 'load-path settings-dir)
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(let ((default-directory  "~/.emacs.d/lisp/"))
  (normal-top-level-add-subdirs-to-load-path))

;; (require 'performance)

;; Bootstrap straight.el
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;; Make sure that org doesn't break when using straight
(straight-use-package 'org)
(straight-use-package 'org-plus-contrib)

;; Make sure that use-package is installed
(straight-use-package 'use-package)
(use-package diminish
  :straight t)

;; Keep emacs Custom-settings in separate file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

;; Load color theme, modeline, icons and fonts
;; (require 'setup-exwm)
(require 'appearance)
;; (require 'setup-all-the-icons)
;; (require 'setup-doom-modeline)

;; Set personal information
(setq user-full-name "Simon Bugge Siggaard"
	  user-mail-address "simsig@gmail.com")

;; Load OS specific settings
(require 'iso-transl)
(require 'mac)
(require 'ubuntu)

;; Better backups
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))
(setq auto-save-default nil)
(setq create-lockfiles nil)
(setq delete-old-versions -1)
(setq version-control t)
(setq vc-make-backup-files t)
(setq auto-save-file-name-transforms '((".*" "~/.emacs.d/auto-save-list/" t)))

;; Set up basic editing functionality
(require 'basic-editing)

;; Add some quality of life improvements
(require 'qol)

;; Setup search and minibuffer navigation
(require 'setup-ivy)
(require 'setup-smex)
;; (require 'setup-helm)
(require 'setup-project)
(require 'setup-bookmark+)
(require 'setup-hl-todo)

;; Setup basic programming utilities
(require 'setup-avy)
(require 'setup-paredit)
(require 'setup-autocomplete)
(require 'setup-snippets)
(require 'setup-commenting)
(require 'setup-magit)
(require 'setup-diff-hl)
(require 'setup-expand-region)
(require 'setup-multiple-cursors)
(require 'setup-drag-stuff)

;; Setup Language Server Protocol and TabNine
(require 'setup-lsp)
;; (require 'setup-tabnine)

;; Specific programming languages and modes
(require 'setup-clojure)
;; (require 'setup-cpp)
(require 'setup-docker)
(require 'setup-haskell)
(require 'setup-elm)
(require 'setup-flycheck)
(require 'setup-go)
(require 'setup-rust)
(require 'setup-markdown)
(require 'setup-doct)
;;;; the following three are order-dependent
;; (require 'setup-deft)
(require 'setup-org)
;; (require 'setup-org-zk)
;; (require 'setup-zettel)
;; (require 'setup-protobuf)
(require 'setup-python)

;; Misc
(require 'setup-writing)
;; (require 'setup-dnd)
(require 'setup-esup)
(require 'setup-cucumber)
(require 'setup-buttercup)

;; EVIL
(require 'setup-evil)

;;; init.el ends here
