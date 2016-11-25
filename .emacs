;; ----------- package setup -----------

(require 'package)

(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))

(package-refresh-contents)

;; packages
(setq package-list '(
    adaptive-wrap
    cider
    clojure-mode
    company
    emmet-mode
    evil
    evil-commentary
    evil-exchange
    evil-leader
    evil-matchit
    evil-snipe
    evil-surround
    fish-mode
    flycheck
    helm
    howdoi
    inf-ruby
    key-chord
    labburn-theme
    linum-relative
    magit
    markdown-mode
    meacupla-theme
    php-mode
    robe
    solarized-theme
    yasnippet
    zenburn-theme))

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
(evil-commentary-mode)
(global-evil-leader-mode)
(global-evil-matchit-mode 1)
(global-evil-surround-mode 1)
(evil-snipe-override-mode 1)
(evil-exchange-install)

;; --- various evil config ---

;; emacs keybinding in insert mode
;; remove all keybindings from insert-state keymap
;; but [escape] should switch back to normal state
(setcdr evil-insert-state-map nil)
(define-key evil-insert-state-map [escape] 'evil-normal-state)

;; turn on evil leader everywhere
(setq evil-leader/in-all-states 1)

;; evil snipe (vim sneak)
(setq evil-snipe-scope 'buffer)
(setq evil-snipe-repeat-keys nil)
(define-key evil-normal-state-map "f" 'evil-snipe-f)
(define-key evil-normal-state-map "F" 'evil-snipe-F)
(define-key evil-normal-state-map "t" 'evil-snipe-t)
(define-key evil-normal-state-map "T" 'evil-snipe-T)

;; --- evil key bindings ---

;; Leader Bindings
(evil-leader/set-leader "<SPC>")
(evil-leader/set-key
  ;; window navigation
  "wl" 'evil-window-right
  "wh" 'evil-window-left
  "wj" 'evil-window-down
  "wk" 'evil-window-up
  "wv" 'evil-window-vsplit
  "ws" 'evil-window-split
  "wc" 'delete-window
  "wo" 'delete-other-windows
  "w=" 'balance-windows
  "wm" 'maximize-window
  "wn" 'minimize-window
  "w-" 'decrease-window-size
  "w+" 'increase-window-size
  ;; help commands
  "hk" 'describe-key
  "hf" 'describe-function
  "hv" 'describe-variable
  ;; commentary
  ";" 'evil-commentary
  ;;
  "ff" 'find-file
  "fe" '(lambda () (interactive) (find-file "~/.emacs"))
  ;;
  "bc" '(lambda () (interactive) (switch-to-buffer "*scratch*"))
  "bs" 'switch-to-buffer
  "bk" 'kill-buffer
  "bp" 'previous-buffer
  "bn" 'next-buffer
  ;; option toggles
  "on" 'global-linum-mode
  "ol" 'global-whitespace-mode
  "or" 'linum-relative-global-mode
  "oh" 'global-hl-line-mode
  "ow" 'global-visual-line-mode
  ;; light / dark colorscheme
  "1" '(lambda () (interactive) (load-theme 'meacupla t))
  "2" '(lambda () (interactive) (load-theme 'labburn t))
  ;;
  "x"  'helm-M-x
  "<SPC>" 'helm-M-x
  "te" 'term
  ":"  'eval-expression
  "e"  'evil-eval-sexp
  "a"  'align-regexp
  ;; 
  "[" 'evil-exchange)

;; control bindings
(define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up) ; vim style C-u
(define-key evil-normal-state-map (kbd "C-p") 'project-find-file)

;; other bindings
(define-key evil-normal-state-map "s" 'evil-snipe-s)
(define-key evil-normal-state-map "S" 'evil-snipe-S)

(key-chord-define evil-insert-state-map "jk" 'evil-normal-state)

(key-chord-define evil-normal-state-map "gn" 'emmet-next-edit-point)
(key-chord-define evil-normal-state-map "ge" 'evil-eval-sexp)

(key-chord-define evil-visual-state-map "ge" 'eval-last-sexp)

;; custom ex commands
(evil-ex-define-cmd "term" 'term)

;; ------------- Packages that aren't evil --------------

;; company mode autocompletion enabled by default
(add-hook 'after-init-hook 'global-company-mode)

;; enable minor modes
(electric-pair-mode 1)      ; auto-pair '' () {}, etc
(global-flycheck-mode)      ; linting
(helm-mode 1)               ; enable helm
(key-chord-mode 1)          ; key chords
(show-paren-mode 1)         ; show matching brakets
(yas-global-mode 1)         ; snippets
(adaptive-wrap-prefix-mode 1) ; word wrap won't screw up indentation

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

(add-hook
 'term-mode-hook
 (lambda ()
   ;; snippets break tab completion in the terminal, so turn them off
   (yas-minor-mode -1)))

;; --------------------- general settings ---------------------

;; (setq visible-bell 1) ;; turn off the bell

;; only scroll one line at a time when the cursor tries to move
;; past the top or bottom of the window
(setq scroll-conservatively 10000)

;; line numbers
(setq linum-format "%d ")
(setq linum-relative-format "%s ")

;; don't even get me started
(setq indent-tabs-mode nil)

;; turn off word wrap
(set-default 'truncate-lines t)

;; pretty colors and fonts
(load-theme 'zenburn t)

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
       (add-to-list 'initial-frame-alist '(font . "Monaco"))
       ;
       (load-theme 'solarized-light t))))

(setq
 initial-scratch-message
 (concat
  ";; Welcome!"
  "\n"))

;; --------- custom functions --------------

(defun date ()
  "display the current time and date"
  (interactive)
  (message (current-time-string)))

(evil-define-operator evil-eval-sexp ()
  "evaluates the current paragraph"
  (interactive)
  (evil-set-marker ?8)
  (evil-visual-char)
  (evil-inner-paragraph)
  (call-interactively 'eval-last-sexp)
  (evil-goto-mark ?8))

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

;; note this is the bash installed by brew, since osx's bash is pretty out of date
;; on a linux box I should just be able to use `/bin/bash`
(defun term ()
  "switch to the ansi-term buffer if we have it open, if not start it"
  (interactive)
  (let ((terminal-buffer (get-buffer "*ansi-term*")))
    (if terminal-buffer
	(switch-to-buffer terminal-buffer)
        (ansi-term "/bin/bash"))))

;; could also use current-prefix-arg instead of (interactive "P")
;; and an explicit function argument.
;; I think this approach is better as then the function can be
;; called explicitly elsewhere if needed
(defun increase-window-size (arg)
  "increase both the height and width of a window
   will take an arg that defines the number of height and width units
   when called interactively, cant take a count
   defaults to 1"
  (interactive "P")
  (let ((n (or arg 1)))
    (evil-window-increase-height n)
    (evil-window-increase-width n)))

(defun decrease-window-size (arg)
  "decrease both the height and width of a window
   will take an arg that defines the number of height and width units
   when called interactively, cant take a count
   defaults to 1"
  (interactive "P")
  (let ((n (or arg 1)))
    (evil-window-decrease-height n)
    (evil-window-decrease-width n)))

;; http://emacs.stackexchange.com/questions/10900/copy-text-from-emacs-to-os-x-clipboard
; (defun copy-from-osx ()
;   (shell-command-to-string "pbpaste"))

; (defun paste-to-osx (text &optional push)
;   (let ((process-connection-type nil))
;     (let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
;       (process-send-string proc text)
;       (process-send-eof proc))))

; (setq interprogram-cut-function 'paste-to-osx)
; (setq interprogram-paste-function 'copy-from-osx)

;; https://www.emacswiki.org/emacs/ZoneMode
(defun zone-choose (pgm)
    "Choose a PGM to run for `zone'."
    (interactive
     (list
      (completing-read
       "Program: "
       (mapcar 'symbol-name zone-programs))))
    (let ((zone-programs (list (intern pgm))))
      (zone)))

;; auto generated stuff
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "5cd0afd0ca01648e1fff95a7a7f8abec925bd654915153fb39ee8e72a8b56a1f" "4e753673a37c71b07e3026be75dc6af3efbac5ce335f3707b7d6a110ecb636a3" "b747fb36e99bc7f497248eafd6e32b45613ee086da74d1d92a8da59d37b9a829" "12b7ed9b0e990f6d41827c343467d2a6c464094cbcc6d0844df32837b50655f9" "04dd0236a367865e591927a3810f178e8d33c372ad5bfef48b5ce90d4b476481" "5e3fc08bcadce4c6785fc49be686a4a82a356db569f55d411258984e952f194a" "7153b82e50b6f7452b4519097f880d968a6eaf6f6ef38cc45a144958e553fbc6" "110bb04298a575bc9b0dc3ee2c885e3bdd11137d0b9c48c89e155d7552359826" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "cdbd0a803de328a4986659d799659939d13ec01da1f482d838b68038c1bb35e8" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "3a69621a68c2d3550a4c777ffc000e1ea66f5bc2f61112814c591e1bda3f5704" "7f5837a7dbf54c2b7c41d94f5eb1373cf63274847d1971037faa24d7f2231eea" "8db4b03b9ae654d4a57804286eb3e332725c84d7cdab38463cb6b97d5762ad26" default)))
 '(global-hl-line-mode nil)
 '(initial-frame-alist (quote ((fullscreen . maximized))))
 '(package-selected-packages
   (quote
    (solarized-theme anti-zenburn-theme zenburn-theme silkworm-theme xpm meacupla-theme alect-themes linum-relative labburn-theme flycheck fish-mode markdown-mode php-mode yasnippet key-chord helm evil-surround evil-leader evil-commentary emmet-mode company))))
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
