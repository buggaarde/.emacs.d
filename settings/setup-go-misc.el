;; -*- lexical-binding: t; -*-

(defun option-list (text)
  (if (string= text "") ""
	(let ((lines (s-lines text))
		  (result))
	  (dolist (line lines result)
		(let ((type
			   (first (last (split-string line))))
			  (names
			   (butlast (split-string (s-replace "," "" line)))))
		  (dolist (name names result)
			(setq result (concat result name " "  (or type "") "\n"))))))))

(defun setter-from (varname)
  (if (string= varname "") ""
	(let ((argname (first (split-string varname)))
		  (type (first (last (split-string varname)))))
	  (concat "func "
			  (s-upper-camel-case argname)
			  "("
			  (s-lower-camel-case argname) " " (or type "")
			  ") Option {\n"
			  "\treturn func(op *Options) {\n"
			  "\t\top."
			  (s-upper-camel-case argname)
			  " = "
			  (s-lower-camel-case argname) "\n"
			  "\t}\n"
			  "}\n"))))

(defun setters-from (option-text)
  (let (result)
	(dolist (option (s-lines (or (option-list option-text) "")) result)
	  (setq result (concat result (setter-from (s-trim option)) "\n")))
	(s-trim result)))

(defun uppercase-arguments (option-text)
  (let ((lines (s-lines option-text))
		(result))
	(save-excursion
	  (dolist (line lines result)
		(let ((args
			   (mapcar '(lambda (s) (s-upper-camel-case
								(s-trim (s-replace "," "" s))))
					   (butlast (split-string line))))
			  (type (first (last (split-string line)))))
		  (setq result (concat result (s-join ", " args) " " type "\n")))))))

(provide 'setup-go-misc)
