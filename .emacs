;; ----------- package setup -----------

(require 'package)

(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))

;; packages
(setq package-list '(
    evil
    evil-surround
    evil-leader
    evil-commentary
    evil-matchit
    helm
    company
    yasnippet
    emmet-mode
    key-chord
    php-mode
    markdown-mode
    fish-mode
    flycheck
    inf-ruby
    robe
    howdoi))

(package-initialize)

;; fetch the list of packages available
(unless package-archive-contents
  (package-refresh-contents))

;; install any missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

;;------------ EVIL MODE --------------

(evil-mode 1)
(global-evil-matchit-mode 1)
(global-evil-surround-mode 1)
(global-evil-leader-mode)
(evil-commentary-mode)

;; --- various evil config ---

;; emacs keybinding in insert mode
;; remove all keybindings from insert-state keymap
;; but [escape] should switch back to normal state
(setcdr evil-insert-state-map nil)
(define-key evil-insert-state-map [escape] 'evil-normal-state)

;; turn on evil leader everywhere
(setq evil-leader/in-all-states 1)

;; --- evil key bindings ---

;; Leader Bindings
(evil-leader/set-leader "<SPC>")
(evil-leader/set-key
  ;; window navigation
  "wl" 'evil-window-right
  "wh" 'evil-window-left
  "wj" 'evil-window-down
  "wk" 'evil-window-up
  ;; help commands
  "hk" 'describe-key
  "hf" 'describe-function
  "hv" 'describe-variable
  ;; commentary
  ";" 'evil-commentary
  ;;
  "ff" 'find-file
  "bs" 'switch-to-buffer)

;; control bindings
(define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up) ; vim style C-u
(define-key evil-normal-state-map (kbd "C-p") 'project-find-file)

;; other bindings
(key-chord-define evil-insert-state-map "jk" 'evil-normal-state)
(key-chord-define evil-normal-state-map "gn" 'emmet-next-edit-point)

;; custom ex commands
(evil-ex-define-cmd "term" 'term)

;; ------------- Packages that aren't evil --------------

;; company mode autocompletion enabled by default
(add-hook 'after-init-hook 'global-company-mode)

;; enable minor modes
(global-flycheck-mode) ; linting
(key-chord-mode 1) ; key chords
(helm-mode 1) ; enable helm
(yas-global-mode 1) ;; snippets
(electric-pair-mode 1) ;; auto-pair '' () {}, etc
(show-paren-mode 1) ;; show matching brakets

;; --- various package config ---

;; key chords
(setq key-chord-two-keys-delay 0.4)

;; helm
(helm-autoresize-mode 1) ;; resize autocomplete window as candidates decrease
(setq helm-autoresize-max-height 30)
(global-set-key (kbd "M-x") 'helm-M-x) ;; rebind M-x to helm's

;; snippets
(setq yas-snippet-dirs '("~/.emacs.d/snippets"))

;; individual file types
(add-hook
 'html-mode-hook
 (lambda ()
   (emmet-mode)
   (define-key evil-insert-state-map (kbd "C-n") 'emmet-next-edit-point)
   (define-key evil-insert-state-map (kbd "C-p") 'emmet-prev-edit-point)))

;; --------------------- general settings ---------------------

;; (setq visible-bell 1) ;; turn off the bell

;; turn off word wrap
(set-default 'truncate-lines t)

;; pretty colors and fonts
(load-theme 'wombat)

;; turn on column numbers
(column-number-mode nil)

;; turn of guish nonsense
(menu-bar-mode -1)

;; gui only options
(if (display-graphic-p)
    ((lambda ()
       ;; get rid of extra gui nonsense
       (tool-bar-mode -1) 
       (toggle-scroll-bar -1)
       ;; fonts
       (set-face-attribute 'default nil :height 120)
       (add-to-list 'default-frame-alist '(font . "Monaco"))
       (add-to-list 'initial-frame-alist '(font . "Monaco")))))

;; stolen from stack overflow, i forget where
(defun node-js-eval-region-or-buffer ()
  "Evaluate the current buffer (or region if mark-active),
   and return the result into another buffer,
   which is to be shown in a window."
  (interactive)
  (let ((debug-on-error t) (start 1) (end 1))
    (cond
     (mark-active
      (setq start (point))
      (setq end (mark)))
     (t
      (setq start (point-min))
      (setq end (point-max))))
    (call-process-region
     start end        ; seems the order does not matter
     "nodejs"           ; node.js
     nil              ; don't delete region
     (current-buffer) ; output buffer
     nil)             ; no redisply during output
    (message "Region or buffer evaluated!")
    (setq deactivate-mark t))) ; deactive the region, regardless

;; also stolen from so
(defun eval-and-replace ()
  "Replace the preceding sexp with its value."
  (interactive)
  (backward-kill-sexp)
  (condition-case nil
      (prin1 (eval (read (current-kill 0)))
         (current-buffer))
    (error (message "Invalid expression")
                  (insert (current-kill 0)))))

;; (global-set-key (kbd "C-x C-e") 'eval-and-replace) 

;; auto generated stuff
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "cdbd0a803de328a4986659d799659939d13ec01da1f482d838b68038c1bb35e8" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "3a69621a68c2d3550a4c777ffc000e1ea66f5bc2f61112814c591e1bda3f5704" "7f5837a7dbf54c2b7c41d94f5eb1373cf63274847d1971037faa24d7f2231eea" "8db4b03b9ae654d4a57804286eb3e332725c84d7cdab38463cb6b97d5762ad26" default)))
 '(initial-frame-alist (quote ((fullscreen . maximized))))
 '(package-selected-packages
   (quote
    (flycheck fish-mode markdown-mode php-mode yasnippet key-chord helm evil-surround evil-leader evil-commentary emmet-mode company))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; turn off flycheck for this file
;; Local Variables:
;; eval: (flycheck-mode -1)
;; End:
