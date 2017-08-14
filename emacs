;; scratchpad

;; (name => `Hello, ${name}!`)("zach");

;; (defun send-with-newline (process s)
;;   (process-send-string process (concat s "\n")))

;; (seq-do (lambda (s)
;; 		  (send-with-newline "*ansi-term*" s)
;; 		  ;; (sleep-for 0.1)
;; 		  )
;; 		'
;;   	 ("function doThings() {" "console.log('working...');" "}"))

;; ----------- package setup -----------

(require 'package)

(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))

;; packages
(setq package-list '(
    adaptive-wrap
    ag
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
    git-timemachine
    helm
    helm-projectile
    howdoi
    inf-ruby
    key-chord
    labburn-theme
    linum-relative
    magit
    markdown-mode
    markdown-preview-mode
	markdown-toc
    php-mode
    projectile
    robe
    solarized-theme
    web-mode
    which-key
    yaml-mode
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
;; but [escape] + "jk" should switch back to normal state
(setcdr evil-insert-state-map nil)
(define-key evil-insert-state-map [escape] 'evil-normal-state)
(key-chord-define evil-insert-state-map "jk" 'evil-normal-state)

;; evil snipe (vim sneak)
(setq evil-snipe-scope 'buffer)
(setq evil-snipe-repeat-keys nil)
(define-key evil-normal-state-map "f" 'evil-snipe-f)
(define-key evil-normal-state-map "F" 'evil-snipe-F)
(define-key evil-normal-state-map "t" 'evil-snipe-t)
(define-key evil-normal-state-map "T" 'evil-snipe-T)

;; --- evil key bindings ---

;; turn on evil leader everywhere
(setq evil-leader/in-all-states 1)

(evil-leader/set-leader "<SPC>")

;; the following two functions are for integrating evil leader + which key
(defun evil-leader-bind-and-document (key fn description)
  "define a leader binding and document it for which-key-mode"
  (which-key-add-key-based-replacements
    (concat "SPC " key) description)
  (evil-leader/set-key key fn))
(defun evil-leader-bind-and-document-prefix (key description &rest bindings)
  "define a leader key binding as well as it's documentation"
  (which-key-add-key-based-replacements (concat "SPC " key) description)
  (while bindings
    (let ((key (pop bindings))
	  (fn (pop bindings))
	  (description (pop bindings)))
      (evil-leader-bind-and-document key fn description))))

;; leader bindings
(evil-leader-bind-and-document-prefix "w" "Window Manipulation"
  "wl" 'evil-window-right "focus right"
  "wh" 'evil-window-left "focus left"
  "wj" 'evil-window-down "focus down"
  "wk" 'evil-window-up "focus up"
  "wv" 'evil-window-vsplit "vertical split"
  "ws" 'evil-window-split "horizontal split"
  "wc" 'delete-window "close this one"
  "wo" 'delete-other-windows "only this one"
  "w=" 'balance-windows "equalize size"
  "wm" 'maximize-window "maximize"
  "wn" 'minimize-window "minimize"
  "w-" 'decrease-window-size "decrease size"
  "w+" 'increase-window-size "increase size"
  "wq" 'evil-save-and-close "write and quit")

(evil-leader-bind-and-document-prefix "h" "Help"
  "hk" 'describe-key "key"
  "hf" 'describe-function "function"
  "hv" 'describe-variable "variable"
  "hm" 'describe-mode "mode")

(evil-leader-bind-and-document-prefix "f" "Files"
  "ff" 'find-file "find file"
  "fe" '(lambda () (interactive) (find-file "~/.emacs")) "~/.emacs"
  "fj" 'dired-jump "jump to parent"
  "fs" 'save-buffer "save"
  "fw" 'save-buffer "write")

(evil-leader-bind-and-document-prefix "b" "Buffers"
  "bc" '(lambda () (interactive) (switch-to-buffer "*scratch*")) "scratch"
  "bi" 'ibuffer "interactive"
  "bk" 'kill-buffer "kill one"
  "bK" 'close-all-buffers "kill all"
  "bl" 'list-buffers "list"
  "bn" 'next-buffer "next"
  "bp" 'previous-buffer "previous"
  "bs" 'switch-to-buffer "switch")

(evil-leader-bind-and-document-prefix "o" "Option Toggle"
  "on" 'linum-mode "line numbers"
  "ol" 'whitespace-mode "show whitespace"
  "or" 'linum-relative-mode "relative line numbers"
  "ow" 'visual-line-mode "word wrap"
  "oc" 'hl-line-mode "cursor line"
  ;; TODO: these should probably live under a different prefix
  "oi" 'org-clock-in "clock in"
  "oo" 'org-clock-out "clock out")

(evil-leader-bind-and-document-prefix "u" "Utility"
  "ug" 'magit-status "magit"
  "ut" 'term "terminal")

(evil-leader-bind-and-document ";" 'evil-commentary "commentary")
(evil-leader-bind-and-document "1" '(lambda () (interactive) (load-theme 'zenburn t)) "dark theme")
(evil-leader-bind-and-document "2" '(lambda () (interactive) (load-theme 'leuven t)) "light theme")
(evil-leader-bind-and-document "<SPC>" 'helm-M-x "meta x")
(evil-leader-bind-and-document ":"  'eval-expression "eval elisp")
(evil-leader-bind-and-document "a"  'align-regexp "regex align")

;; control bindings
(define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up) ; vim style C-u
(define-key evil-normal-state-map (kbd "C-p") 'project-find-file)

;; other bindings
(define-key evil-normal-state-map "s" 'evil-snipe-s)
(define-key evil-normal-state-map "S" 'evil-snipe-S)
(define-key evil-normal-state-map "-" 'dired-jump)

(key-chord-define evil-normal-state-map "gn" 'emmet-next-edit-point)
(key-chord-define evil-normal-state-map "ge" 'evil-eval-sexp)

;; custom ex commands
(evil-ex-define-cmd "term" 'term)

(global-set-key (kbd "C-x C-?") 'which-key-show-top-level)
(global-set-key (kbd "C-x ?") 'which-key-show-top-level)

;; ------------- Packages that aren't evil --------------

;; company mode autocompletion enabled by default
(add-hook 'after-init-hook 'global-company-mode)

;; enable minor modes
(electric-pair-mode 1)        ; auto-pair '' () {}, etc
(global-flycheck-mode)        ; linting
(helm-mode 1)                 ; enable helm
(key-chord-mode 1)            ; key chords
(show-paren-mode 1)           ; show matching brakets
(yas-global-mode 1)           ; snippets
(adaptive-wrap-prefix-mode 1) ; make word wrap play nicely with indentation

;; --- various package config ---

;; key chords
(setq key-chord-two-keys-delay 0.4)

;; helm
(helm-autoresize-mode 1) ;; resize autocomplete window as candidates decrease
(setq helm-autoresize-max-height 30)
(global-set-key (kbd "M-x") 'helm-M-x) ;; rebind M-x to helm's

;; snippets
(setq yas-snippet-dirs '("~/.emacs.d/snippets"))

;; ------------------- filetype hooks ----------------

(add-hook 'html-mode-hook (lambda ()
  (emmet-mode)
  (local-set-key (kbd "M-n") 'emmet-next-edit-point)
  (local-set-key (kbd "M-p") 'emmet-prev-edit-point)))

(add-hook 'term-mode-hook (lambda ()
  (yas-minor-mode -1))) ;; snippets break tab completion in the
                        ;; terminal, so turn them off

;; (add-hook 'javascript-mode-hook (lambda ()
;;   (set-variable tab-width 2 t)))

;; --------------------- general settings ---------------------

(setq paragraph-start "\\|[     ]*$")
(setq paragraph-separate "[     ]*$")

(setq-default tab-width 4)

(setq which-key-sort-order 'which-key-key-order)

(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
(setq exec-path (append exec-path '("/usr/local/bin")))

(setq-default line-spacing 0.25)

;; I feel like I'm constantly fighting this and it freezes the ui
;; whenever it triggers
(setq auto-save-default nil)

;; (setq visible-bell 1) ;; turn off the bell

;; don't clutter the working directory with backup files
(setq backup-directory-alist '((".*" . "/home/zach/.emacs.d/tmp/")))
(setq auto-save-file-name-transforms `((".*" "/home/zach/.emacs.d/tmp/" t)))

;; only scroll one line at a time when the cursor tries to move
;; past the top or bottom of the window
(setq scroll-conservatively 10000)

;; line numbers
(setq linum-format "%d ")
(setq linum-relative-format "%s ")

;; turn off word wrap by default
(set-default 'truncate-lines t)

;; pretty colors and fonts
(load-theme 'zenburn t)

;; turn off column numbers
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
       (set-face-attribute 'default nil :family "Inconsolata" :height 140)
       (add-to-list 'default-frame-alist '(font . "Inconsolata"))
       (add-to-list 'initial-frame-alist '(font . "Inconsolata"))
       ;; default colorscheme
       (load-theme 'leuven t))))

;; (set-face-attribute 'default nil :family "Input" :height 130)
;; (set-face-attribute 'default nil :family "Operator Mono" :height 130)
;; (set-face-attribute 'default nil :family "Trebuchet MS" :height 140)
;; (set-face-attribute 'default nil :family "Inconsolata" :height 140)
;; (set-face-attribute 'default nil :family "Monaco" :height 120)

(setq initial-scratch-message
 (concat ";; Welcome!" "\n"))

;; ----------------- org mode ----------------

;; local-set-key
(setq org-log-done 'time)
(setq org-default-notes-file (concat "/Users/zach/sync/codeup.org"))
(setq org-refile-targets '((nil :maxlevel . 9) (org-agenda-files :maxlevel . 9)))
(setq org-closed-keep-when-no-todo t)
(setq org-todo-keywords '((sequence "TODO(t!)" "WAITING(w@/!)" "|" "DONE(d!)")))
(setq org-confirm-babel-evaluate nil)
(setq org-startup-indented t)

(global-set-key "\C-ca" 'org-agenda)
(define-key global-map "\C-cc" 'org-capture)

(add-hook 'org-mode-hook
 (lambda ()
   (org-indent-mode)
   (flycheck-mode -1)))

;; --------- custom functions --------------

(defun js-eval-repl (start end)
  "send the current selection to the currently running javascript repl
create the repl if it does not exist"
  (interactive "r")
  (process-send-string
   (or (get-buffer-process "js-repl")
	   (start-process "js-repl" (get-buffer-create "*js-repl*") "node"))
   (concat (buffer-substring start end) "\n")))

(defun org-to-markdown ()
  "convert the current buffer to markdown and put it on the clipboard"
  (interactive)
  (shell-command-on-region
   (point-min) (point-max)
   "pandoc -f org -t markdown_github | pbcopy"))

(defun close-all-buffers ()		
  (interactive)
  (mapc 'kill-buffer (buffer-list)))

(defun date ()
  "display the current time and date"
  (interactive)
  (message (current-time-string)))

;; this feels hacky...
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
        (ansi-term "/usr/local/bin/bash"))))

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
	("bc4b650c41b16b98166b35da94b366c6a9e1e7883bbf4937c897fb7bd05aa619" "a0dc0c1805398db495ecda1994c744ad1a91a9455f2a17b59b716f72d3585dde" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "f5512c02e0a6887e987a816918b7a684d558716262ac7ee2dd0437ab913eaec6" "83faf27892c7119f6016e3609f346d3dae3516dede8fd8a5940373d98f615b4e" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "5cd0afd0ca01648e1fff95a7a7f8abec925bd654915153fb39ee8e72a8b56a1f" "4e753673a37c71b07e3026be75dc6af3efbac5ce335f3707b7d6a110ecb636a3" "b747fb36e99bc7f497248eafd6e32b45613ee086da74d1d92a8da59d37b9a829" "12b7ed9b0e990f6d41827c343467d2a6c464094cbcc6d0844df32837b50655f9" "04dd0236a367865e591927a3810f178e8d33c372ad5bfef48b5ce90d4b476481" "5e3fc08bcadce4c6785fc49be686a4a82a356db569f55d411258984e952f194a" "7153b82e50b6f7452b4519097f880d968a6eaf6f6ef38cc45a144958e553fbc6" "110bb04298a575bc9b0dc3ee2c885e3bdd11137d0b9c48c89e155d7552359826" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "cdbd0a803de328a4986659d799659939d13ec01da1f482d838b68038c1bb35e8" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "3a69621a68c2d3550a4c777ffc000e1ea66f5bc2f61112814c591e1bda3f5704" "7f5837a7dbf54c2b7c41d94f5eb1373cf63274847d1971037faa24d7f2231eea" "8db4b03b9ae654d4a57804286eb3e332725c84d7cdab38463cb6b97d5762ad26" default)))
 '(exec-path
   (quote
	("/usr/bin" "/bin" "/usr/sbin" "/sbin" "/Applications/Emacs.app/Contents/MacOS/bin-x86_64-10_9" "/Applications/Emacs.app/Contents/MacOS/libexec-x86_64-10_9" "/Applications/Emacs.app/Contents/MacOS/libexec" "/Applications/Emacs.app/Contents/MacOS/bin" "/usr/local/bin" nil)))
 '(global-hl-line-mode nil)
 '(global-visual-line-mode t)
 '(global-whitespace-mode nil)
 '(initial-frame-alist (quote ((fullscreen . maximized))))
 '(org-agenda-files (quote ("~/sync/codeup.org")))
 '(org-babel-load-languages
   (quote
	((emacs-lisp . t)
	 (clojure . t)
	 (js . t)
	 (ruby . t)
	 (python . t)
	 (dot . t)
	 (sh . t))))
 '(org-export-backends (quote (ascii html icalendar latex md)))
 '(org-file-apps
   (quote
	((auto-mode . emacs)
	 ("\\.mm\\'" . default)
	 ("\\.x?html?\\'" . default)
	 ("\\.pdf\\'" . default)
	 (directory . emacs))))
 '(org-startup-indented t t)
 '(package-selected-packages
   (quote
	(markdown-toc spacemacs-theme god-mode yaml-mode web-mode ag helm-projectile projectile git-timemachine which-key markdown-preview-mode company-jedi solarized-theme anti-zenburn-theme zenburn-theme silkworm-theme xpm alect-themes linum-relative labburn-theme flycheck fish-mode markdown-mode php-mode yasnippet key-chord helm evil-surround evil-leader evil-commentary emmet-mode company)))
 '(pdf-view-midnight-colors (quote ("#DCDCCC" . "#383838")))
 '(projectile-mode t nil (projectile))
 '(rainbow-identifiers-choose-face-function (quote rainbow-identifiers-cie-l*a*b*-choose-face))
 '(rainbow-identifiers-cie-l*a*b*-color-count 1024)
 '(rainbow-identifiers-cie-l*a*b*-lightness 80)
 '(rainbow-identifiers-cie-l*a*b*-saturation 25)
 '(which-key-mode t))
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
;; ## added by OPAM user-setup for emacs / base ## 56ab50dc8996d2bb95e7856a6eddb17b ## you can edit, but keep this line
(require 'opam-user-setup "~/.emacs.d/opam-user-setup.el")
;; ## end of OPAM user-setup addition for emacs / base ## keep this line
