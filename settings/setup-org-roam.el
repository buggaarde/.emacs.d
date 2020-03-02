(use-package org-roam
  :straight (:host github :repo "jethrokuan/org-roam")
  :after org
  :hook (org-mode . org-roam)

  :custom (org-roam-directory "~/everything/")
  :bind
  ("C-c n l" . org-roam)
  ("C-c n t" . org-roam-today)
  ("C-c n f" . org-roam-find-file)
  ("C-c n i" . org-roam-insert)
  ("C-c n g" . org-roam-show-graph)

  :config

  (use-package deft
	:straight t
	:after org
	
	:bind
	("C-c n d" . deft)
	:custom
	(deft-recursive t)
	(deft-use-filter-string-for-filename t)
	(deft-default-extension "org")
	(deft-directory "~/everything/")
	(deft-use-filename-as-title t)))

(provide 'setup-org-roam)
