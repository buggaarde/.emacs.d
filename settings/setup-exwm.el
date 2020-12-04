;; -*- lexical-binding: t; -*-

(use-package exwm
  :straight (exwm
			 :type git :host github
			 :repo "ch11ng/exwm")
  
  :config
  (use-package exwm-config
	:load-path "straight/repos/exwm"

	:config
	(exwm-config-default))

  (use-package exwm-randr
	:load-path "straight/repos/exwm"

	:config
	(setq exwm-randr-workspace-output-plist '(0 "eDP-1" 1 "DP-3"))
	(exwm-randr-enable)

	:hook
	(exwm-randr-screen-change . (lambda ()
								  (start-process-shell-command
								   "xrandr" nil
								   "xrandr --output DP-3 --auto --scale 2x2 --above eDP-1 --output eDP-1 --mode 3840x2160 --scale 1x1 --pos 0x2400")))))

(provide 'setup-exwm)
