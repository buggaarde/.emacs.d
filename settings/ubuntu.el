;;on ubuntu, Emacs scrolls 5 lines at a time, per default. Change that
;;to 1 line at a time
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1) ((control) . nil)))

;; and remove progressive scrolling -- I know what I want to do
(setq mouse-wheel-progressive-speed nil)

(provide 'ubuntu)
