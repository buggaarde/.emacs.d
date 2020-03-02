(defun gtags-root-dir ()
  "Returns GTAGS root directory or nil if doesn't exist."
  (with-temp-buffer
    (if (zerop (call-process "global" nil t nil "-pr"))
        (buffer-substring (point-min) (1- (point-max)))
      nil)))

(defun gtags-update ()
  "Make GTAGS incremental update"
  (call-process "global" nil nil nil "-u"))

(defun gtags-update-hook ()
  (when (gtags-root-dir)
    (gtags-update)))

(defun format-and-save()
  (interactive)
  (clang-format-buffer)
  (save-buffer))


(custom-set-variables
 '(flycheck-c/c++-googlelint-executable "/usr/local/bin/cpplint"))

(eval-after-load 'flycheck
  '(progn
     (require 'flycheck-google-cpplint)
     ;; Add Google C++ Style checker.
     ;; In default, syntax checked by Clang and Cppcheck.
     (flycheck-add-next-checker 'c/c++-cppcheck
                                '(warning . c/c++-googlelint))))

(use-package flycheck-clang-tidy
  :straight t
  :after flycheck
  :hook (flycheck-mode . flycheck-clang-tidy-setup))

(use-package helm-gtags
  :straight t
  
  :init
  (setq helm-gtags-ignore-case t
		helm-gtags-auto-update t
		helm-gtags-use-input-at-cursor t
		helm-gtags-pulse-at-cursor t
		helm-gtags-prefix-key "\C-ct"
		helm-gtags-suggested-key-mapping t)
  
  (use-package clang-format
	:straight t
	:defer t)

  (use-package google-c-style
	:straight t
	:defer t)

  (use-package platformio-mode
	:straight t
	:defer t
	:after irony-mode

	:config
	(add-to-list 'company-backends 'company-irony)
	:hook ((cc-mode . (lambda ()
						 (irony-mode)
						 (irony-eldoc)
						 (platformio-conditionally-enable)))
		   (irony-mode . (lambda ()
						   (define-key irony-mode-map [remap completion-at-point]
							 'irony-completion-at-point-async)
						   
						   (define-key irony-mode-map [remap complete-symbol]
							 'irony-completion-at-point-async)
						   
						   (irony-cdb-autosetup-compile-options)))
		   (flycheck-mode . flycheck-irony-setup)))
  
  
  :hook (((c-mode c++-mode cc-mode asm-mode) . helm-gtags-mode)
		 (after-save . gtags-update-hook)
		 (c-mode-common . google-set-c-style)
		 (c-mode-common . google-make-newline-indent))

  :bind (:map helm-gtags-mode-map
		 ("C-c t a" . 'helm-gtags-tags-in-this-function)
		 ("C-j" . 'helm-gtags-select)
		 ("M-." . 'helm-gtags-dwim)
		 ("M-," . 'helm-gtags-pop-stack)
		 :map c-mode-base-map
		 ("C-x C-s" . 'format-and-save)))

(provide 'setup-cpp)
