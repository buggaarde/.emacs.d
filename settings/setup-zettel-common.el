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

(defun zettel--org-extracted-headline-by-name (ast name)
  (org-element-map ast 'headline
	(lambda (h)
	  (when (string= (org-element-property :raw-value h) name)
		h))
	nil t))

(provide 'setup-zettel-common)
