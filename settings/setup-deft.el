(use-package deft
  :straight t
  
  :custom
  (deft-extensions '("org" "md" "txt") "The system we use is going to be in org-mode")
  (deft-directory "~/zettel/")
  (deft-new-file-format "%Y%m%d%H%M%S")
  (deft-strip-summary-regexp
	(concat "\\("
           "[\n\t]" ;; blank
           "\\|^#\\+[[:upper:]_]+:.*$" ;; org-mode metadata
		   "\\|^#\\+[[:lower:]_]+:.*$" ;; org-mode metadata
		   "\\|^\\*\\* Note.*$" ;; zettel-note headline
           "\\)"))

  :commands (deft deft-refresh deft-new-file deft-find-file))


(provide 'setup-deft)
