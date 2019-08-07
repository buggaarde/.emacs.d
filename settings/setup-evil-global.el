(evil-leader/set-key
 "e" 'find-file
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
 "<SPC>" 'avy-goto-word-or-subword-1)

(provide 'setup-evil-global)
