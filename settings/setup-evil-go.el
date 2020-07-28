;; -*- lexical-binding: t; -*-

(evil-leader/set-key-for-mode
  'go-mode
  "." 'godef-jump
  "," 'pop-tag-mark)

(provide 'setup-evil-go)
