;; emacs-gui style
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-mode nil)
 '(custom-safe-themes t)
 '(fringe-mode 0 nil (fringe))
 '(global-hl-line-mode t)
 '(linum-relative-global-mode t)
 '(menu-bar-mode nil)
 '(package-selected-packages
   (quote
    (dired-sidebar seoul256-theme ov frame-local dash-functional latex-preview-pane cmake-project cmake-ide cmake-mode buffer-move buffer-expose all-the-icons-gnus all-the-icons-ivy all-the-icons-dired auto-complete-c-headers auto-complete-clang arduino-mode platformio-mode emms doom-themes mingus lice cyberpunk-theme cyberpunk-2019-theme hack-mode hackernews hacker-typer php-mode powerline linum-relative neotree company spacemacs-theme)))
 '(scroll-bar-mode nil)
 '(tool-bar-mode nil)
 '(tooltip-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Consolas-with-Yahei" :foundry "MS  " :slant italic :weight bold :height 113 :width normal)))))

;; MELPA
(require 'cl)
(load "package")
(package-initialize)
(add-to-list 'package-archives
	           '("melpa" . "https://melpa.org/packages/") t)

(require 'autopair)
(autopair-global-mode)

;; must have packages
(defvar niroge/packages '(ac-slime
			                    auto-complete
			                    autopair
			                    cider
			                    clojure-mode
			                    elpy
			                    f
			                    feature-mode
			                    flycheck
			                    graphviz-dot-mode
			                    htmlize
			                    magit
			                    markdown-mode
			                    org
			                    paredit
			                    powerline
			                    rvm
			                    smex
			                    solarized-theme
			                    web-mode
			                    writegood-mode
			                    yaml-mode)
  "Default Packages")

(defun niroge/packages-installed-p()
  (loop for pkg in niroge/packages
	      when (not (package-installed-p pkg)) do (return nil)
	      finally (return t)))

(unless (niroge/packages-installed-p)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg niroge/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))

;; emacs appearence
(load-theme 'cyberpunk t)
(linum-relative-global-mode)
(setq linum-relative-current-symbol "")
(setq inhibit-splash-screen t
      initial-scratch-message nil
      initial-major-mode 'org-mode)

(setq-default indicate-empty-lines t)
(when (not indicate-empty-lines)
  (toggle-indicate-empty-lines))

(setq powerline-default-separator 'slant)
(powerline-center-theme)
(global-hl-line-mode +1)

;; configure emacs
(setq
 ;; backup system
 backup-by-copying t
 backup-directory-alist
 '(("." . "~/.saves/"))
 delete-old-versions t
 kept-new-versions 6
 kept-old-versions 2
 version-control t)

(delete-selection-mode t)
(transient-mark-mode t)
(setq x-select-enable-clipboard t)
(defalias 'yes-or-no-p 'y-or-n-p)

;; emacs completion system
;; (global-company-mode)
;; (setq company-dabbrev-downcase 0)
;; (setq company-idle-delay 0)
;; (setq company-minimum-prefix-length 1)
;; (ido-mode t)
;; (setq ido-enable-flex-matching t
;;       ido-use-virtual-buffers t)
;; No more company, auto-complete
(global-auto-complete-mode t)
;; configure global indentation
(setq tab-width 2)
(setq indent-tabs-mode nil)
(setq c-basic-offset 2)
(setq c-default-style "gnu")

;; set user details
(setq user-full-name "Nitu Robert-Georgian"
      user-mail-address "0x0ff1c3@protonmail.com")

;; set up keyboard binding
(global-set-key (kbd "RET") 'newline-and-indent)
(global-set-key (kbd "C-;") 'comment-or-uncomment-region)
(global-set-key (kbd "M-/") 'hippie-expand)
(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)
(global-set-key (kbd "C-c a k") 'compile)
(global-set-key (kbd "C-c a n") 'neotree-toggle)
(global-set-key (kbd "C-c a g") 'magit-status)
(global-set-key (kbd "C-c a s") 'eshell)
(global-set-key (kbd "C-c a d") 'make-directory)
(global-set-key (kbd "C-c a <left>") 'windmove-left)
(global-set-key (kbd "C-c a <right>") 'windmove-right)
(global-set-key (kbd "C-c a <up>") 'windmove-up)
(global-set-key (kbd "C-c a <down>") 'windmove-down)
(global-set-key (kbd "C-c a <C-left>") 'buf-move-left)
(global-set-key (kbd "C-c a <C-right>") 'buf-move-right)
(global-set-key (kbd "C-c a <C-up>") 'buf-move-up)
(global-set-key (kbd "C-c a <C-down") 'buf-move-down)
(global-set-key (kbd "<mouse-9>") 'next-buffer)
(global-set-key (kbd "<mouse-8>") 'previous-buffer)

;; Configure EMMS
(require 'emms-setup)
(emms-standard)
(emms-default-players)
(setq neo-theme (if (display-graphic-p) 'icons 'arrow))

;; Configure sidebar and icons-in-terminal
(add-to-list 'load-path "~/.local/share/icons-in-terminal/") ;; If it's not already done
(add-to-list 'load-path "~/.emacs.d/elpa/sidebar.el/")
(require 'sidebar)
(global-set-key (kbd "C-x C-f") 'sidebar-open)
(global-set-key (kbd "C-x C-a") 'sidebar-buffers-open)
