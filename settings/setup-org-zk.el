(use-package org-zk
  :straight (org-zk
			 :host github :repo "buggaarde/org-zk")
  :config
  :bind (("C-c z o" . org-zk-open-note)
		 ("C-c z l" . org-zk-insert-backlink)
		 ("C-c z b" . org-zk-add-backlink-to-references)
		 ("C-c z f" . org-zk-add-folge-backlink-to-references)
		 ("C-c z g" . org-zk-gather-notes-beginning-here)
		 ("C-c z n" . org-zk-create-empty-note-and-open)
		 ("C-c z N" . org-zk-create-note-with-title-and-open)
		 ("C-c z W" . org-zk-save-all-notes)))

(provide 'setup-org-zk)
