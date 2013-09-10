;; load packages
(add-to-list 'load-path "~/.emacs.d")

;; steng


;;(require 'cl)
;;(require 'ffap)
;;(require 'uniquify)
;;(require 'ansi-color)
;;(require 'recentf)
;;(require 'linum)
;;(require 'smooth-scrolling)
;;(require 'whitespace)
;;(require 'dired-x)
;;(require 'compile)
;;(menu-bar-mode -1)
;;(normal-erase-is-backspace-mode 1)
;;(put 'downcase-region 'disabled nil)
;;(put 'upcase-region 'disabled nil)
;;(setq column-number-mode t)
;;(setq inhibit-startup-message t)
;;(setq save-abbrevs nil)
;;(setq show-trailing-whitespace t)
;;(setq suggest-key-bindings t)
;;(setq vc-follow-symlinks t)
;;
;; 
;;(custom-set-faces
;; ;; custom-set-faces was added by Custom.
;; ;; If you edit it by hand, you could mess it up, so be careful.
;; ;; Your init file should contain only one such instance.
;; ;; If there is more than one, they won't work right.
;; '(column-marker-1 ((t (:background "red"))))
;; '(diff-added ((t (:foreground "cyan"))))
;; '(flymake-errline ((((class color) (background light)) (:background "Red"))))
;; '(font-lock-comment-face ((((class color) (min-colors 8) (background light)) (:foreground "red"))))
;; '(fundamental-mode-default ((t (:inherit default))))
;; '(highlight ((((class color) (min-colors 8)) (:background "white" :foreground "magenta"))))
;; '(isearch ((((class color) (min-colors 8)) (:background "yellow" :foreground "black"))))
;; '(linum ((t (:foreground "black" :weight bold))))
;; '(region ((((class color) (min-colors 8)) (:background "white" :foreground "magenta"))))
;; '(secondary-selection ((((class color) (min-colors 8)) (:background "gray" :foreground "cyan"))))
;; '(vertical-border ((t nil))))
;;
;;;; ------------
;;;; -- Macros --
;;;; ------------
;;(load "defuns-config.el")
;;(fset 'align-equals "\C-[xalign-regex\C-m=\C-m")
;;(global-set-key "\M-=" 'align-equals)
;;(global-set-key "\C-x\C-m" 'execute-extended-command)
;;(global-set-key "\C-c;" 'comment-or-uncomment-region)
;;(global-set-key "\M-n" 'next5)
;;(global-set-key "\M-p" 'prev5)
;;(global-set-key "\M-o" 'other-window)
;;(global-set-key "\M-i" 'back-window)
;;(global-set-key "\C-z" 'zap-to-char)
;;(global-set-key "\C-h" 'backward-delete-char)
;;(global-set-key "\M-d" 'delete-word)
;;(global-set-key "\M-h" 'backward-delete-word)
;;(global-set-key "\M-u" 'zap-to-char)
;;
;;;; ---------------------------
;;;; -- JS Mode configuration --
;;;; ---------------------------
;;(load "js-config.el")
;;(add-to-list 'load-path "~/.emacs.d/jade-mode") ;; github.com/brianc/jade-mode
;;(require 'sws-mode)
;;(require 'jade-mode)    
;;(add-to-list 'auto-mode-alist '("\\.styl$" . sws-mode))
;;(add-to-list 'auto-mode-alist '("\\.jade$" . jade-mode))
;;
;; python
(autoload 'python-mode "python-mode.el" "Python mode." t)
(setq auto-mode-alist (append '(("/*.\.py$" . python-mode)) auto-mode-alist)) 
;; cedet
;;(load-file "/usr/share/emacs/site-lisp/cedet/common/cedet.el")
(global-ede-mode t)
(require 'semantic/sb)
(semantic-mode 1)
;;(semantic-load-enable-code-helpers)
;;(global-srecode-minor-mode 1)

;; matlab
;;(add-to-list 'load-path "~/.emacs.d/matlab-emacs")
;; (load-library "matlab-load")
;; (matlab-cedet-setup)

;; smart compile
(load-file "~/.emacs.d/smart-compile.el")

;; undo tree
(load-file "/home/ienchev/.emacs.d/elpa/undo-tree-20130812.1224/undo-tree.el")

(global-undo-tree-mode 1)
(setq undo-tree-auto-save-history 1)
(setq undo-tree-history-directory-alist (quote (("." . "~/.emacs.d/undo/"))))
(require 'undo-tree)

;; melpa
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

;; vim navigation
(require 'evil-leader)
(require 'evil)
(evil-mode 1)

;; set leader to ,
(setq evil-leader/leader "," evil-leader/in-all-states t)
(global-evil-leader-mode)

;; setup leader combinations
(evil-leader/set-key
  "f" 'find-file
  "b" 'switch-to-buffer
  "e" 'split-window-right
  "o" 'split-window-below
  "w" 'delete-window
  "q" 'kill-buffer
  "x" 'delete-frame
)

;; comment combinations
(require 'evil-nerd-commenter)
(global-set-key (kbd "C-;") 'evilnc-comment-or-uncomment-lines)
(global-set-key (kbd "C-:") 'evilnc-comment-or-uncomment-to-the-line)
(global-set-key (kbd "C-c c") 'evilnc-copy-and-comment-lines)

;; ido
(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t
      ido-everywhere t)
      ;; ido-rotate-file-list-default t
      ;; ido-use-filename-at-point (quote guess))

;; fullscreen startup
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; customize 
(setq c-auto-newline nil)
(setq whitespace-line-column 80)
(setq tab-width 8)
(setq indent-tabs-mode nil)
(setq c-basic-offset 4)
(setq whitespace-style '(lines-tail newline indentation empty space-after-tab space-before-tab trailing tab-mark))
(setq default-directory "/home/ienchev/")

;; keybindings

;; esc quits

(define-key evil-normal-state-map [escape] 'keyboard-quit)
(define-key evil-visual-state-map [escape] 'keyboard-quit)
(define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)

;; ret space
(defun my-move-key (keymap-from keymap-to key)
     "Moves key binding from one keymap to another, deleting from the old location. "
     (define-key keymap-to key (lookup-key keymap-from key))
     (define-key keymap-from key nil)
     )
   (my-move-key evil-motion-state-map evil-normal-state-map (kbd "RET"))
   (my-move-key evil-motion-state-map evil-normal-state-map " ")

;; other keys
(defun save-buffer-and-switch-to-vi ()
  (interactive)
  (save-buffer)
  (evil-change-to-initial-state)
)

(global-set-key [f9] 'smart-compile)

(define-key evil-normal-state-map "\C-s" 'save-buffer-and-switch-to-vi)
(define-key evil-insert-state-map "\C-s" 'save-buffer-and-switch-to-vi)
(define-key evil-visual-state-map "\C-s" 'save-buffer-and-switch-to-vi)

(define-key evil-normal-state-map "\C-t" 'term)
(define-key evil-insert-state-map "\C-t" 'term)
(define-key evil-visual-state-map "\C-t" 'term)

(define-key evil-normal-state-map "\C-f" 'find-file)
(define-key evil-insert-state-map "\C-f" 'find-file)
(define-key evil-visual-state-map "\C-f" 'find-file)

(define-key evil-normal-state-map "\C-o" 'other-window)
(define-key evil-insert-state-map "\C-o" 'other-window)
(define-key evil-visual-state-map "\C-o" 'other-window)

(define-key evil-normal-state-map "\C-b" 'switch-to-buffer)
(define-key evil-insert-state-map "\C-b" 'switch-to-buffer)
(define-key evil-visual-state-map "\C-b" 'switch-to-buffer)

(define-key evil-normal-state-map "\C-j" 'previous-buffer)
(define-key evil-insert-state-map "\C-j" 'previous-buffer)
(define-key evil-visual-state-map "\C-j" 'previous-buffer)

(define-key evil-normal-state-map "\C-k" 'next-buffer)
(define-key evil-insert-state-map "\C-k" 'next-buffer)
(define-key evil-visual-state-map "\C-k" 'next-buffer)

(define-key evil-normal-state-map "\C-e" 'split-window-right)
(define-key evil-insert-state-map "\C-e" 'split-window-right)
(define-key evil-visual-state-map "\C-e" 'split-window-right)

;; save place in file
(setq save-place-file "~/.emacs.d/saved-places")
(require 'saveplace)
(setq-default save-place t)

;; set font
(set-default-font "Bitstream Vera Sans Mono-11")
;; remove scrollbar
(scroll-bar-mode -1)
;; remove menu bar
(menu-bar-mode -1)
;; custom set
(tool-bar-mode -1)
;; show parenthesis
(show-paren-mode t)
;; copy-paste should work with other X clients
(setq x-select-enable-clipboard t) 
(setq interprogram-paste-function 'x-cut-buffer-or-selection-value)
;; Not display the initial message 
(setq inhibit-startup-message t)
;make the y or n suffice for a yes or no question
(fset 'yes-or-no-p 'y-or-n-p)
;; Show column-number in the mode line
(column-number-mode 1)
;; Turn on mouse wheel
(mouse-wheel-mode t)
;; show mark visually
(transient-mark-mode t) 
;; replace highlighted text with what I type rather than just
;; inserting at a point
(delete-selection-mode t)
;; show line on the side
(require 'linum-relative)
(global-linum-mode t)
;; disable scratch
(kill-buffer "*scratch*")

