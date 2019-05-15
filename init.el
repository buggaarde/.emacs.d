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

;; Keep emacs Custom-settings in separate file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

;; Set personal information
(setq user-full-name "Simon Bugge Siggaard"
	  user-mail-address "simsig@gmail.com")

;; Specify melpa
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)

;; Make sure that use-package is installed
(dolist (pack '(use-package diminish))
  (unless (package-installed-p pack)
	(package-install pack)))

(require 'use-package)
(require 'diminish)
(setq use-package-verbose nil)

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
(require 'setup-ivy)

;; Setup basic programming utilities
(require 'setup-paredit)
(require 'setup-autocomplete)
(require 'setup-snippets)
(require 'setup-commenting)
(require 'setup-magit)
(require 'setup-expand-region)
(require 'setup-multiple-cursors)

;; Specific programming languages and modes
(require 'setup-flycheck)
(require 'setup-go)
(require 'setup-markdown)
(require 'setup-docker)
(require 'setup-protobuf)
(require 'setup-python)
(require 'setup-clojure)
(require 'setup-org)

;; Misc
(require 'setup-writing)
(require 'setup-dnd)

;; Revert back to default GC treshold
(setq-default gc-cons-threshold 800000)
;;; init.el ends here
