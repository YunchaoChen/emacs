(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(display-time-mode t)
 '(menu-bar-mode nil)
 '(display-time-24hr-format t)
 '(global-linum-mode t)
 '(inhibit-startup-screen t)
 '(scroll-bar-mode nil)
 '(show-paren-mode t)
 '(tool-bar-mode nil))

 ;; font
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "Grey15" :foreground "Grey" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 120 :width normal :foundry "unknown" :family "DejaVu Sans Mono")))))

;; Set auto save backup file to ~/.emacs_bak
(setq backup-directory-alist (quote (("." . "/opt/emacs_bak"))))

;; Auto indent when insert a new line
(global-set-key (kbd "RET") 'newline-and-indent)
(setq tab-width 4)
(setq default-tab-width 4)
(setq indent-tabs-mode t)
(setq c-basic-offset 4)

;; Open file with read only mode
(defun make-some-files-read-only ()
  "when file opened is of a certain mode, make it read only"
    (when (memq major-mode '(c-mode c++-mode tcl-mode text-mode python-mode java-mode))
	    (toggle-read-only 1)))

(add-hook 'find-file-hooks 'make-some-files-read-only)

;; Using cscope for look up C/C++ source code.
(add-to-list 'load-path "/opt/emacs/emacs.d/xcscope")
(require 'xcscope)

;; Add git-emacs support
(add-to-list 'load-path "/opt/emacs/emacs.d/git-emacs")
(require 'git-emacs)

;; Use IBus in emacs.
(add-to-list 'load-path "/opt/emacs/emacs.d/ibus-el")
(setq ibus-agent-file-name "/opt/emacs/emacs.d/ibus-el/ibus-el-agent")
(require 'ibus)
(add-hook 'after-init-hook 'ibus-mode-on)
(global-set-key (kbd "\C-\\") 'ibus-toggle)

;; color theme
(add-to-list 'load-path "/opt/emacs/emacs.d/color-theme")
(require 'color-theme)
(eval-after-load "color-theme"
  '(progn
     (color-theme-initialize)))
(color-theme-charcoal-black)

;; Add yasnippet
(add-to-list 'load-path "/opt/emacs/emacs.d/yasnippet")
(require 'yasnippet)
(yas-global-mode 1)

;; Add the lastest org-mode support.
(setq load-path (cons "/opt/emacs/emacs.d/org-8.2.1/lisp" load-path))
(setq load-path (cons "/opt/emacs/emacs.d/org-8.2.1/contrib/lisp" load-path))
(require 'org-install)
(require 'org-publish)
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(add-hook 'org-mode-hook 'turn-on-font-lock)
(add-hook 'org-mode-hook 
(lambda () (setq truncate-lines nil)))

;; Add sdcv support.
(setq load-path (cons "/opt/emacs/emacs.d/sdcv/" load-path))
(require 'showtip)
(require 'sdcv)
(global-set-key (kbd "C-c d") 'sdcv-search-pointer+)

;; full screen
(defun emacs-fullscreen ()
	   (interactive)
	   (x-send-client-message
			nil 0 nil "_NET_WM_STATE" 32
			'(2 "_NET_WM_STATE_FULLSCREEN" 0)))

;;(emacs-fullscreen)