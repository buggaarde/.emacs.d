(require 'org)

(defun zettel-captures--timestamp-file-name ()
  (concat "~/zettel/" (format-time-string "%Y%m%d%H%M%S") ".org"))

(setq zettel-captures
	  (doct '(("Zettel" :keys "z"
			   :children
			   (("Permanent note" :keys "p"
				 :file zettel-captures--timestamp-file-name
				 :type plain
				 :template ("#+title:"
							"#+startup: showall"
							"** Note"
							"%?"
							""
							"** References"
							""
							"** Sources"
							"")))))))

(provide 'setup-org-capture)
