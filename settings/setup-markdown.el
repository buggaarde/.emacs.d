;; -*- lexical-binding: t; -*-

(use-package markdown-mode
  :straight t
  :defer t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
		 ("\\.md\\'" . markdown-mode)
		 ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown")

  :hook ((markdown-mode . (lambda () (visual-line-mode)))))


(provide 'setup-markdown)
