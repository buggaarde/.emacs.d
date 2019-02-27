(require 'package)
(unless package--initialized
  (package-initialize t))

(setq package-enable-at-startup nil)
(require 'org)
(org-babel-load-file
 (expand-file-name "Simon.org"
                   user-emacs-directory))
