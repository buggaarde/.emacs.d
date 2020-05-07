;; -*- lexical-binding: t; -*-

(require 'cl-lib)
(require 'setup-zettel-common)

(defun zettel--copy-note-from-file (buffer filename &optional level)
  "Copy the contents of the Note headline in FILE and insert them into BUFFER.
Create a buffer called BUFFER if not already existing."
  (with-current-buffer (get-buffer-create buffer)
	(let* ((title (zettel--title-of-note-in-file filename))
		   (ast (zettel--org-element-parse-file filename))
		   (notes (org-element-extract-element
				   (org-element-map ast 'headline
					 (lambda (h)
					   (when (string= (org-element-property :raw-value h) "Note")
						 h))
					 nil t)))
		   (note (org-element-map notes 'section #'identity nil t))
		   (note (when note (org-element-extract-element note))))
	  (insert
	   (org-element-interpret-data
		`(headline (:level ,(or level 2) :title ,title :post-blank 1) ,note))))))

(defun zettel--all-links-in-file (filename)
  (let* ((ast (zettel--org-element-parse-file filename))
		 (refs (org-element-map ast 'headline
				 (lambda (h)
				   (when (string= (org-element-property :raw-value h) "References")
					 h))
				 nil t))
		 (links (org-element-map refs 'link #'identity)))
	(mapcar #'org-element-extract-element links)))

(defvar zettel-non-children-prefixes '("<:")
  "If a link description begins with anything in this list, it is not considered a child node.")

(defun)

(defun zettel--depth-first-search-link-filenames ()
  (let* ((file (file-name-nondirectory (buffer-file-name)))
		 (stack (list file))
		 (visited-notes (list)))
	(while stack
	  (let* ((filename (pop stack))
			 (links (zettel--all-links-in-file filename)))
		(unless (member filename visited-notes)
		  (progn
			(push filename visited-notes)
			(when links
			  (cl-loop for l in (nreverse links) do
					   (push (org-element-property :path l) stack)))))))
	(nreverse visited-notes)))

(defun zettel-gather-notes-beginning-here ()
  (interactive)
  (let ((buffer
		 (get-buffer-create
		  (format "ZK gathering: %s"
				  (zettel--title-of-note-in-current-buffer)))))
	(with-current-buffer buffer
	  (org-mode))
	(mapc (lambda (f) (zettel--copy-note-from-file buffer f))
		  (zettel--depth-first-search-link-filenames))))

(provide 'setup-zettel-gather)
