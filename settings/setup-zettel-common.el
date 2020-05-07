;; -*- lexical-binding: t; -*-

(defun zettel--org-element-parse-file (filename)
  (with-temp-buffer
	(progn
	  (org-mode)
	  (insert-file-contents filename)
	  (org-element-parse-buffer))))

(defun zettel--title-of-note-in-current-buffer ()
  (let ((ast (org-element-parse-buffer)))
	(org-element-map ast 'keyword 
	  (lambda (k) (org-element-property :value k))
	  nil t)))

(defun zettel--title-of-note-in-file (filename)
  (with-temp-buffer
	(progn
	  (org-mode)
	  (insert-file-contents filename)
	  (zettel--title-of-note-in-current-buffer))))

(provide 'setup-zettel-common)
