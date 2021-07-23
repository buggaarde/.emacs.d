;; -*- lexical-binding: t; -*-

(evil-leader/set-key
  ;; basic navigation
  "s" 'swiper
  "e" 'counsel-find-file
  "b" 'ivy-switch-buffer
  "x" 'counsel-M-x
  "k" 'kill-buffer
  "w" 'save-buffer
  "W" 'save-some-buffers
  "0" 'delete-window
  "1" 'delete-other-windows
  "2" 'split-window-vertically
  "3" 'split-window-horizontally
  "o" 'ace-window
  "g" 'magit-status
  "c" 'comment-dwim-2
  "<SPC>" 'avy-goto-char-timer
  "+" 'balance-windows
  "q" 'fill-paragraph
  "," 'pop-tag-mark
  ":" 'goto-line

  ;; org-zk
  "zo" 'org-zk-open-note
  "zn" 'org-zk-create-empty-note-and-open
  "zN" 'org-zk-create-note-with-title-and-open
  "zl" 'org-zk-insert-backlink
  "zb" 'org-zk-add-backlink-to-references
  "zf" 'org-zk-add-folge-backlink-to-references
  "zg" 'org-zk-gather-notes-beginning-here
  "zW" 'org-zk-save-all-notes

  ;; lsp
  "." 'lsp-find-definition
  "lj" 'lsp-ui-imenu
  "l?" 'lsp-find-references
  "la" 'lsp-execute-code-action
  "lr" 'lsp-rename
  "lq" 'lsp-workspace-restart
  "lQ" 'lsp-workspace-shutdown

  ;; project bindings
  "pf" 'project-find-file
  "ps" 'project-search

  ;; flycheck
  "fe" 'flycheck-list-errors)

(provide 'setup-evil-global)
