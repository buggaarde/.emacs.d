(use-package org
  :ensure t
  :defer t

  :config
  (use-package ox-pandoc
	:ensure t

	:config
	;; set column-width for README.md exports
	(setq org-pandoc-options-for-gfm '((wrap . "preserve")))))

(provide 'setup-org)
