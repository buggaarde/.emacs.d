;; Increase GC threshold temporarily, while init.el loads
(setq-default gc-cons-threshold 100000000)

;; Start Emacs in full-screen on second monitor, if there
(setq workarea (cdr (assoc 'workarea (nth 0 (last (display-monitor-attributes-list))))))
(setq width-offset (nth 0 workarea))
(setq height-offset (nth 1 workarea))

(setq default-frame-alist `((top + ,height-offset) (left + ,width-offset)))

(custom-set-variables
 '(initial-frame-alist (quote ((fullscreen . maximized)))))

;; Remove toolbar, menu bar and scroll bar
(when window-system
  (tooltip-mode -1)
  (tool-bar-mode -1)
  (menu-bar-mode -1)
  (scroll-bar-mode -1))

;; Remove splash screen
(setq inhibit-splash-screen t)

;; Set path to dependencies
(setq settings-dir
      (expand-file-name "settings" user-emacs-directory))

;; Set up load path
(add-to-list 'load-path settings-dir)
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(let ((default-directory  "~/.emacs.d/lisp/"))
  (normal-top-level-add-subdirs-to-load-path))

;; Keep emacs Custom-settings in separate file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

;; Set personal information
(setq user-full-name "Simon Bugge Siggaard"
	  user-mail-address "simsig@gmail.com")

;; Specify melpa
(require 'package)
(when (not package--initialized)
  (package-initialize))
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
;; (setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")
(package-refresh-contents)

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

;; Make sure that use-package is installed
(straight-use-package 'use-package)
(use-package diminish
  :straight t)

;; Load color theme and fonts
(require 'appearance)

;; Load OS specific settings
(require 'iso-transl)
(require 'mac)

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
;; (require 'setup-ivy)
(require 'setup-helm)
(require 'setup-projectile)

;; Setup basic programming utilities
(require 'setup-paredit)
(require 'setup-autocomplete)
(require 'setup-snippets)
(require 'setup-commenting)
(require 'setup-magit)
(require 'setup-diff-hl)
(require 'setup-expand-region)
(require 'setup-multiple-cursors)

;; Setup org-roam
(require 'setup-org-roam)

;; Setup Language Server Protocol and TabNine
(require 'setup-lsp)
(require 'setup-tabnine)

;; Specific programming languages and modes
(require 'setup-clojure)
(require 'setup-cpp)
(require 'setup-docker)
(require 'setup-haskell)
(require 'setup-elm)
(require 'setup-flycheck)
(require 'setup-go)
(require 'setup-markdown)
(require 'setup-org)
(require 'setup-protobuf)
(require 'setup-python)

;; Misc
(require 'setup-writing)
(require 'setup-dnd)

;; EVIL
;; (require 'setup-evil)

;; Revert back to default GC treshold
(setq-default gc-cons-threshold 800000)
;;; init.el ends here
(put 'downcase-region 'disabled nil)
