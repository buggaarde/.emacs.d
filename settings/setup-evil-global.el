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

  ;; projectile bindings
  "pf" 'project-find-file
  "ps" 'project-search)

(provide 'setup-evil-global)
