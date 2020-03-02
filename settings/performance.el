;; Increase garbage collection threshold during startup
(defun defer-garbage-collection-h ()
  (setq gc-cons-threshold most-positive-fixnum))

(defun restore-garbage-collection-h ()
  ;; Defer it so that commands launched immediately after will enjoy the
  ;; benefits.
  (run-at-time
   1 nil (lambda () (setq gc-cons-threshold 16777216))))

(add-hook 'minibuffer-setup-hook #'defer-garbage-collection-h)
(add-hook 'minibuffer-exit-hook #'restore-garbage-collection-h)


;; Use Garbage Collection Magic Hack to only garbage collect during idle or zone-outs
(require 'gcmh)
(with-eval-after-load 'gcmh
  (setq gcmh-idle-delay 10
		;; gcmh-verbose t
        gcmh-high-cons-threshold 16777216) ; 16mb
  (add-hook 'focus-out-hook #'gcmh-idle-garbage-collect))

;; stop Emacs from consulting the file-name-handler-alist during startup
(defvar buggaarde--file-name-handler-alist file-name-handler-alist)
(setq file-name-handler-alist nil)

(add-hook 'emacs-startup-hook
  (lambda ()
    (setq file-name-handler-alist buggaarde--file-name-handler-alist)))


;; This stops Emacs from resizing the GUI when font-size does not match system font size
(setq frame-inhibit-implied-resize t)

;; 
(setq initial-major-mode 'fundamental-mode)

(setq package-enable-at-startup nil ; don't auto-initialize!
      ;; don't add that `custom-set-variables' block to my init.el!
      package--init-file-ensured t)

(provide 'performance)
