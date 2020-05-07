;; -*- lexical-binding: t; -*-

(use-package org
  :config
  (use-package ox-pandoc
	:straight t

	:config
	;; set column-width for README.md exports
	(setq org-pandoc-options-for-gfm '((wrap . "preserve"))))

  ;; Run/highlight code using babel in org-mode
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((emacs-lisp . t)
	 (python . t)
	 (shell . t)
	 (haskell . t)))
  
  ;; Syntax highlight in #+BEGIN_SRC blocks
  (setq org-src-fontify-natively t)
  ;; Don't prompt before running code in org
  (setq org-confirm-babel-evaluate nil)

  ;; Create template captures for zettel etc.
  (require 'setup-org-capture)
  (setq org-capture-templates `(,@zettel-captures))

  :bind (("C-c C-c" . org-capture))

  :hook (org-mode . visual-line-mode))



(provide 'setup-org)
