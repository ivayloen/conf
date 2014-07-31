; load packages
(add-to-list 'load-path "~/.emacs.d")
;;(load "/usr/share/emacs/site-lisp/python-mode/python-mode.el")
(autoload 'python-mode "python-mode.el" "Python mode." t)
(setq auto-mode-alist (append '(("/*.\.py$" . python-mode)) auto-mode-alist))

;; melpa
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

;; python
(autoload 'python-mode "python-mode.el" "Python mode." t)
(setq auto-mode-alist (append '(("/*.\.py$" . python-mode)) auto-mode-alist)) 

;; cedet
(load-file "~/.emacs.d/minimal-cedet-config.el")

;; (matlab-cedet-setup)
(setq auto-mode-alist (append '(("/*.\.m$" . matlab-mode)) auto-mode-alist)) 
;; smart compile
(load-file "~/.emacs.d/smart-compile.el")

;; undo tree
(global-undo-tree-mode 1)
(setq undo-tree-auto-save-history 1)
(setq undo-tree-history-directory-alist (quote (("." . "~/.emacs.d/undo/"))))
(require 'undo-tree)

;;ecb
(require 'ecb)
 
(load-theme 'zenburn t)

;; vim navigation
(require 'evil-numbers)
(require 'evil-leader)
(require 'evil)
(evil-mode 1)


;; column marker
(require 'fill-column-indicator)
(setq fci-rule-width 1)
(setq fci-rule-column 80)
(setq fci-rule-color "red")

(add-hook 'text-mode-hook 'fci-mode)
(add-hook 'prog-mode-hook 'fci-mode)
;; (define-globalized-minor-mode global-fci-mode fci-mode (lambda () (set-fill-column 80) (fci-mode 1)))
;; (global-fci-mode 1)
;; auto-complete mode
(require 'auto-complete)
(auto-complete-mode 1)
;; set leader to ,
(setq evil-leader/leader "," evil-leader/in-all-states t)
(global-evil-leader-mode)

;; setup leader combinations
;; (evil-leader/set-key
  ;; "f" 'find-file
  ;; "b" 'switch-to-buffer
  ;; "e" 'split-window-right
  ;; "o" 'split-window-below
  ;; "w" 'delete-window
  ;; "q" 'kill-buffer
  ;; "x" 'delete-frame
;; )

;; comment combinations
(require 'evil-nerd-commenter)
;; (global-set-key (kbd "C-;") 'evilnc-comment-or-uncomment-lines)
;; (global-set-key (kbd "C-:") 'evilnc-comment-or-uncomment-to-the-line)
;; (global-set-key (kbd "C-c c") 'evilnc-copy-and-comment-lines)

(evil-leader/set-key
  "cc" 'evilnc-comment-or-uncomment-lines)

;; helm
;; (require 'helm)
;; (helm-mode 1)
;; ido
(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)

;; fullscreen startup
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; customize 
;; (setq c-auto-newline nil)
(setq whitespace-line-column 80)
(setq tab-width 8)
;; (setq indent-tabs-mode nil)
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
;; (defun my-move-key (keymap-from keymap-to key)
     ;; "Moves key binding from one keymap to another, deleting from the old location. "
     ;; (define-key keymap-to key (lookup-key keymap-from key))
     ;; (define-key keymap-from key nil)
     ;; )
   ;; (my-move-key evil-motion-state-map evil-normal-state-map (kbd "RET"))
   ;; (my-move-key evil-motion-state-map evil-normal-state-map " ")

;; other keys
(defun save-buffer-and-switch-to-vi ()
  (interactive)
  (save-buffer)
  (evil-change-to-initial-state)
)

(defun lookup-method()
  (interactive)
  (ecb-goto-window-methods)
  (evil-search-forward)
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

(define-key evil-normal-state-map "\C-z" 'split-window-below)
(define-key evil-insert-state-map "\C-z" 'split-window-below)
(define-key evil-visual-state-map "\C-z" 'split-window-below)

(define-key evil-normal-state-map "\C-q" 'kill-buffer)
(define-key evil-insert-state-map "\C-q" 'kill-buffer)
(define-key evil-visual-state-map "\C-q" 'kill-buffer)

(define-key evil-normal-state-map "\C-x" 'delete-frame)
(define-key evil-insert-state-map "\C-x" 'delete-frame)
(define-key evil-visual-state-map "\C-x" 'delete-frame)

(define-key evil-normal-state-map "\C-w" 'delete-window)
(define-key evil-insert-state-map "\C-w" 'delete-window)
(define-key evil-visual-state-map "\C-w" 'delete-window)

(define-key evil-normal-state-map "\C-h" 'ecb-goto-window-history)
(define-key evil-insert-state-map "\C-h" 'ecb-goto-window-history)
(define-key evil-visual-state-map "\C-h" 'ecb-goto-window-history)

(define-key evil-normal-state-map "\C-c" 'ecb-goto-window-directories)
(define-key evil-insert-state-map "\C-c" 'ecb-goto-window-directories)
(define-key evil-visual-state-map "\C-c" 'ecb-goto-window-directories)

;; (define-key evil-normal-state-map "\C-d" 'ecb-goto-window-methods)
;; (define-key evil-insert-state-map "\C-d" 'ecb-goto-window-methods)
;; (define-key evil-visual-state-map "\C-d" 'ecb-goto-window-methods)

(define-key evil-normal-state-map "\C-d" 'lookup-method)
(define-key evil-insert-state-map "\C-d" 'lookup-method)
(define-key evil-visual-state-map "\C-d" 'lookup-method)

(define-key evil-normal-state-map "\C-n" 'ecb-goto-window-sources)
(define-key evil-insert-state-map "\C-n" 'ecb-goto-window-sources)
(define-key evil-visual-state-map "\C-n" 'ecb-goto-window-sources)

(define-key evil-normal-state-map "\C-l" 'ecb-goto-window-edit-last)
(define-key evil-insert-state-map "\C-l" 'ecb-goto-window-edit-last)
(define-key evil-visual-state-map "\C-l" 'ecb-goto-window-edit-last)


;; (define-key evil-normal-state-map (kbd "RET") 'my-enter)
(define-key evil-insert-state-map (kbd "RET") 'newline-and-indent)

 ;;(define-key evil-normal-state-map "\C-" 'ecb-activate)
;;(define-key evil-insert-state-map "\C-" 'ecb-activate)
;;(define-key evil-visual-state-map "\C-" 'ecb-activate)
;;
;;(define-key evil-normal-state-map "\C-" 'ecb-deactivate)
;;(define-key evil-insert-state-map "\C-" 'ecb-deactivate)
;;(define-key evil-visual-state-map "\C-" 'ecb-deactivate)



;; (define-key evil-insert-state-map "RET" nil)

;; save place in file
(setq save-place-file "~/.emacs.d/saved-places")
(require 'saveplace)
(setq-default save-place t)
(set-face-attribute 'default nil :family  "Consolas" :height 120) 
;; set font
;; (set-default-font "-microsoft-Consolas-normal-normal-normal-*-*-*-*-*-m-0-iso10646-1")
;; (set-face-attribute 'default nil :height 120)
;; remove scrollbar
(scroll-bar-mode -1)
;; remove menu bar
(menu-bar-mode -1)
;; custom set
(tool-bar-mode -1)
;; show parenthesis
(show-paren-mode t)
;; copy-paste should work with other X clients
(setq x-selesdct-enable-clipboard t) 
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


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ecb-layout-window-sizes (quote (("left8" (ecb-directories-buffer-name 0.17647058823529413 . 0.2545454545454545) (ecb-sources-buffer-name 0.17647058823529413 . 0.12727272727272726) (ecb-methods-buffer-name 0.17647058823529413 . 0.32727272727272727) (ecb-history-buffer-name 0.17647058823529413 . 0.2727272727272727)))))
 '(ecb-mouse-click-destination (quote last-point))
 '(ecb-options-version "2.40")
 '(ecb-primary-secondary-mouse-buttons (quote mouse-1--mouse-2)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
