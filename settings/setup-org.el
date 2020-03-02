(use-package org
  :straight t
  :defer t

  :config
  (use-package ox-pandoc
	:straight t

	:config
	;; set column-width for README.md exports
	(setq org-pandoc-options-for-gfm '((wrap . "preserve")))))

(provide 'setup-org)
