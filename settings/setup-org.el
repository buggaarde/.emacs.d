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

  ;; GTD workflow:
  (setq org-agenda-files `(,(expand-file-name "~/everything/")))
  (setq org-capture-templates
		(doct '(("Everything" :keys "e"
				 :file "~/everything/everything.org"
				 :prepend t
				 :template ("* %{todo-state} %?"
							"_Desired outcome:_")
				 :todo-state "Review"))))
  
  (setq org-refile-targets
		'((nil :maxlevel . 1)
		  (org-agenda-files :maxlevel . 2)))
  
  ;;; Custom agenda-views
  (setq org-agenda-custom-commands
        '(("n" "Next Actions"
           ((agenda "")
            (todo "NextAction")))
          ("r" "Reviews"
           ((todo "Review")))
          ("p" "Projects"
           ((todo "Project")))
          ("w" "Weekly review"
           ((agenda "fortnight")
            (todo "Review")
            (todo "Project")
            (todo "NextAction")
            (todo "Someday/Maybe")))))

  (setq org-todo-keyword-faces
        '(;; prettier, fuller green than "green"
		  ("DONE" . (:foreground "#15B300"))
		  ;; same kind of red as on murder case files
          ("CANCELLED" . (:foreground "#C91414"))
		  ;; a dark grey that falls nicely into the background with the Jazz-color theme
          ("DEFERRED" . (:foreground "#5E5E5E"))
		  ;; golden yellow.
          ("TODO" . (:foreground "#ffd700"))
		  ;; a darker yellow than "TODO"
          ("Waiting" . (:foreground "#AB9000"))
		  ;; Orange/Golden
          ("NextAction" . (:foreground "#FFBB00"))
		  ;; light grey
          ("Review" . (:foreground "#9E998B"))
		  ;; Teal
          ("Project" . (:foreground "#00FF99"))
		  ;; Dark grey
          ("Trashed" . (:foreground "#363636"))
		  ;; Purple
          ("Someday/Maybe" . (:foreground "#671B82"))
		  ;; Lighter grey than "Review"
          ("Tickler" . (:foreground "#E3E3E3"))))

  (defun simon-org-archive-done-tasks ()
    (interactive)
    (org-map-entries
     (lambda ()
       (org-archive-subtree)
       (setq org-map-continue-from (outline-previous-heading)))
     "/DONE" 'agenda))
  
  :bind (("C-c c" . org-capture)
		 ("C-c a" . org-agenda))

  :hook (org-mode . visual-line-mode))

(provide 'setup-org)
