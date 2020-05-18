;; -*- lexical-binding: t; -*-

(require 'cl-lib)
(require 'setup-zettel-common)

(defun zettel--copy-note-from-file (buffer filename)
  "Copy the contents of the Note headline in FILE and insert them into BUFFER.
Create a buffer called BUFFER if not already existing."
  (with-current-buffer (get-buffer-create buffer)
	(let* ((title (zettel--title-of-note-in-file filename))
		   (type (get-text-property 0 :type filename))
		   (level (get-text-property 0 :level filename))
		   (visited? (get-text-property 0 :visited? filename))
		   (ast (zettel--org-element-parse-file filename))
		   (notes (zettel--org-extracted-headline-by-name ast "Note"))
		   (note (org-element-map notes 'section #'identity nil t))
		   (note (when note (org-element-extract-element note))))
	  (if visited?
		  (setq note
				(concat
				 "/Duplicate note. The contents can be found where the note was first encountered in the gathering process./\n"
				 "/Activate radio targets (by pressing =C-c C-c= at an appropriate headline) to go to that note./\n"))
		(setq title `(radio-target () ,title)))
	  (cond
	   ((eq type :singular)
		;; insert title as bold, and the note underneath
		(insert
		 (org-element-interpret-data
		  `((bold
			 ()	(underline
				 () ,title))
			"\n" ,note "\n"))))
	   ((or (eq type :branch)
			(eq type :root))
		;; insert the title as a heading with the level associated with it
		(insert
		 (org-element-interpret-data
		  `(headline
			(:level ,level
			 :title ,title
			 :post-blank 1)
			,note))))))))

(defun zettel--all-links-in-file (filename)
  (let* ((ast (zettel--org-element-parse-file filename))
		 (refs (zettel--org-extracted-headline-by-name ast "References"))
		 (links (org-element-map refs 'link #'identity)))
	(mapcar #'org-element-extract-element links)))

(setq zettel-non-children-prefixes '("<:"))

(defun zettel--link-description-has-non-child-prefix? (link)
  (let ((match? nil))
	(dolist (pre zettel-non-children-prefixes match?)
	  (let* ((desc (zettel--link-description link))
			 (desc-matches? (string-prefix-p pre desc)))
		(setq match? (or match? desc-matches?))))
	match?))

(defun zettel--link-description (link)
  (car (org-element-contents link)))

(defun zettel--all-children-in-file (filename)
  (when-let* ((ast (zettel--org-element-parse-file filename))
			  (refs (zettel--org-extracted-headline-by-name ast "References"))
			  (links (org-element-map refs 'link #'identity))
			  (children (seq-remove
						 #'zettel--link-description-has-non-child-prefix?
						 links))
			  (child-paths (cl-loop for c in children
									collect (org-element-property :path c)))
			  (num-children (length children))
			  (parent-level (get-text-property 0 :level filename)))
	(if (= num-children 1)
		`(,(propertize (car child-paths) :type :singular :level parent-level))
	  (cl-loop for c in child-paths
			   collect (propertize c :type :branch :level (1+ parent-level))))))



(defun zettel--depth-first-search-link-filenames ()
  (let* ((file (propertize
				(file-name-nondirectory (buffer-file-name))
				:type :root :level 1))
		 (stack (list file))
		 (visited-notes (list)))
	(while stack
	  (let* ((filename (pop stack))
			 (links (zettel--all-children-in-file filename))
			 (already-visited? (member filename visited-notes)))
		(when already-visited?
			(setq filename (propertize filename :visited? t)))
		(push filename visited-notes)
		(unless already-visited?
		  (when links
			(cl-loop for l in (nreverse links) do
					 (push l stack))))))
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
