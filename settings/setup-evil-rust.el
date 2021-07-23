;; -*- lexical-binding: t; -*-

(evil-leader/set-key-for-mode
  'rustic-mode
  "ls" 'lsp-rust-analyzer-status)

(provide 'setup-evil-rust)
