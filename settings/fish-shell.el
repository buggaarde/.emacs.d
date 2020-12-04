;; -*- lexical-binding: t; -*-

(when (string-equal
	   "fish\n"
	   (car (last (split-string
				   (shell-command-to-string "echo $SHELL")
				   "/"))))
  (let ((path-from-shell (replace-regexp-in-string
                          "[ \t\n]*$"
                          ""
                          (shell-command-to-string "set -xg $PATH"))))
    (setenv "PATH" path-from-shell)))

(provide 'fish-shell.el)
