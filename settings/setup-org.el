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

  ;; org-latex-preview
  ;; ;; Increase default latex preview scale to match text size
  (setq org-format-latex-options (plist-put org-format-latex-options :scale 2.5))
  (setq org-preview-latex-process 'dvisvgm)

  ;; GTD workflow:
  (setq org-agenda-files `(,(expand-file-name "~/everything/")))
  (setq org-capture-templates
		(doct '(("Everything" :keys "e"
				 :file "~/everything/everything.org"
				 :prepend t
				 :template ("* %{todo-state} %?"
							"Captured on: %U")
				 :todo-state "TODO"))))
  
  (setq org-refile-targets
      '(("projects.org" :regexp . "\\(?:\\(?:Note\\|Task\\)s\\)")))
  
  (setq org-refile-use-outline-path 'file)
  (setq org-outline-path-complete-in-steps nil)

  (setq org-log-done 'time)
  (setq org-agenda-span 14)

  (setq org-lowest-priority ?D)
  (setq org-default-priority ?D)
  ;;; Custom agenda-views
  (setq org-agenda-custom-commands
        '(("g" "Get Things Done"
         ((agenda nil
                  ((org-agenda-skip-function
                    '(org-agenda-skip-entry-if 'deadline))
				   (org-agenda-hide-tags-regexp ".*")
                   (org-deadline-warning-days 0)))
          (todo "NEXT"
                ((org-agenda-skip-function
                  '(org-agenda-skip-entry-if 'deadline))
				 (org-agenda-sorting-strategy
				  '(priority-down effort-up category-keep))
                 (org-agenda-prefix-format "  %i %-12:c [%e] ")
				 (org-agenda-hide-tags-regexp ".*")
                 (org-agenda-overriding-header "Tasks\n")))
          (agenda nil
                  ((org-agenda-entry-types '(:deadline))
                   (org-agenda-format-date "")
                   (org-deadline-warning-days 28)
				   (org-agenda-hide-tags-regexp ".*")
                   (org-agenda-skip-function
                    '(org-agenda-skip-entry-if 'notregexp "\\* TODO"))
                   (org-agenda-overriding-header "Deadlines\n")))
		  (tags-todo "projects"
                ((org-agenda-skip-function
                  '(org-agenda-skip-entry-if 'deadline 'todo '("NEXT")))
                 (org-agenda-prefix-format "  %i %-12:c [%e] ")
				 (org-agenda-hide-tags-regexp ".*")
                 (org-agenda-overriding-header "Projects\n")))
          (tags-todo "review"
                     ((org-agenda-prefix-format "  %?-12t% s")
					  (org-agenda-hide-tags-regexp ".*")
                      (org-agenda-overriding-header "Inbox\n")))
          (tags "CLOSED>=\"<today>\""
                ((org-agenda-overriding-header "Completed today\n")))))))

  (advice-add 'org-refile :after
			  (lambda (&rest _)
				(org-save-all-org-buffers)))

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
