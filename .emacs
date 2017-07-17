(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cfengine-indent 1)
 '(column-number-mode t)
 '(global-visible-mark-mode t)
 '(package-selected-packages
   (quote
    (wc-mode neotree applescript-mode ack magit clj-refactor yaml-mode visual-fill-column visible-mark use-package unfill typopunct solarized-theme smooth-scrolling smex smartparens rainbow-delimiters projectile markdown-mode magit-popup lua-mode keyfreq imenu-anywhere iedit ido-ubiquitous hl-sexp gruvbox-theme git-commit fish-mode exec-path-from-shell darktooth-theme company color-theme-solarized clojure-mode-extra-font-locking clojure-cheatsheet aggressive-indent adoc-mode 4clojure)))
 '(reb-re-syntax (quote string))
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(markup-meta-face ((t (:foreground "gray40" :height 140 :family "Inconsolata"))))
 '(markup-title-0-face ((t (:inherit markup-gen-face :height 1.6))))
 '(markup-title-1-face ((t (:inherit markup-gen-face :height 1.5))))
 '(markup-title-2-face ((t (:inherit markup-gen-face :height 1.4))))
 '(markup-title-3-face ((t (:inherit markup-gen-face :weight bold :height 1.3))))
 '(markup-title-5-face ((t (:inherit markup-gen-face :underline t :height 1.1)))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Miscellaneous config

;; Proxy
;; (setq url-proxy-services '(("http" . "proxy.corproot.net:8079")
;;                            ("https" . "proxy.corproot.net:8079")))

;; Timestamp
(add-hook 'before-save-hook 'time-stamp)

;; When at the beginning of the line, Ctrl-K removes the whole
;; line, instead of just emptying it.
(setq kill-whole-line t)

;; Paste text where the cursor is, not where the mouse is.
(setq mouse-yank-at-point t)

;; Make completion case-insensitive
(setq completion-ignore-case t)
(setq read-file-name-completion-ignore-case t)

;; key bindings
(global-set-key [(meta g)] 'goto-line)	;override set-face
(global-set-key [(meta \`)] 'other-frame)	;match the Mac "next app window" keybinding

;; Highlight current line
(global-hl-line-mode 1)

;; Show line numbers
(global-linum-mode)

;; http://emacswiki.org/emacs/WinnerMode
(when (fboundp 'winner-mode)
  (winner-mode 1))

;; Key binding to use "hippie expand" for text autocompletion
;; http://www.emacswiki.org/emacs/HippieExpand
(global-set-key (kbd "M-/") 'hippie-expand)

;; Lisp-friendly hippie expand
(setq hippie-expand-try-functions-list
      '(try-expand-dabbrev
        try-expand-dabbrev-all-buffers
        try-expand-dabbrev-from-kill
        try-complete-lisp-symbol-partially
        try-complete-lisp-symbol))

;; Highlights matching parenthesis
(show-paren-mode 1)

;; Interactive search key bindings. By default, C-s runs
;; isearch-forward, so this swaps the bindings.
(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)

;; Don't use hard tabs
(setq-default indent-tabs-mode nil)

;; Emacs can automatically create backup files. This tells Emacs to
;; put all backups in ~/.emacs.d/backups. More info:
;; http://www.gnu.org/software/emacs/manual/html_node/elisp/Backup-Files.html
(setq backup-directory-alist `(("." . ,(concat user-emacs-directory
                                               "backups"))))
;; From https://www.masteringemacs.org/article/effective-editing-movement
;; I recommend adding this to your .emacs, as it makes C-n insert
;; newlines if the point is at the end of the buffer. Useful, as it
;; means you won't have to reach for the return key to add newlines!
(setq next-line-add-newlines t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Functions

;; From http://www.emacswiki.org/emacs/NavigatingParentheses
;; modified to use smartparens instead of the default commands
;; and to work on brackets and braces
(defun goto-match-paren (arg)
  "Go to the matching paren/bracket, otherwise (or if ARG is not nil) insert %.
vi style of % jumping to matching brace."
  (interactive "p")
  (if (not (memq last-command '(set-mark
                                cua-set-mark
                                goto-match-paren
                                down-list
                                up-list
                                end-of-defun
                                beginning-of-defun
                                backward-sexp
                                forward-sexp
                                backward-up-list
                                forward-paragraph
                                backward-paragraph
                                end-of-buffer
                                beginning-of-buffer
                                backward-word
                                forward-word
                                mwheel-scroll
                                backward-word
                                forward-word
                                mouse-start-secondary
                                mouse-yank-secondary
                                mouse-secondary-save-then-kill
                                move-end-of-line
                                move-beginning-of-line
                                backward-char
                                forward-char
                                scroll-up
                                scroll-down
                                scroll-left
                                scroll-right
                                mouse-set-point
                                next-buffer
                                previous-buffer
                                previous-line
                                next-line
                                )
                 ))
      (self-insert-command (or arg 1))
    (cond ((looking-at "\\s\(") (sp-forward-sexp) (backward-char 1))
	  ((looking-at "\\s\)") (forward-char 1) (sp-backward-sexp))
	  (t (self-insert-command (or arg 1))))))
(global-set-key (kbd "%") 'goto-match-paren)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Packages

;; Configure the package system
(setq package-archives '(("gnu"       . "https://elpa.gnu.org/packages/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")
			 ("melpa"     . "https://melpa.org/packages/")))
(package-initialize)

;; Refresh package list
(when (not package-archive-contents)
  (package-refresh-contents))

(when (not (package-installed-p 'use-package))
  (package-install 'use-package))

;; Customize use-package
(use-package use-package
  :config
  (setq use-package-always-ensure t)) ; Always install missing packages


;; OS-specific configs
(cond ((eq system-type 'darwin)
       ;; Mac-specific stuff

       ;; Make Command act as Meta, Option as Alt, right-Option as Super
       (setq mac-command-modifier 'meta)
       (setq mac-option-modifier 'alt)
       (setq mac-right-option-modifier 'super)

       ;; Some color magic
       (setq ns-use-srgb-colorspace t)

       )
      ((eq system-type 'windows-nt)
       ;; Windows-specific code goes here.
       )
      ((eq system-type 'gnu/linux)
       ;; Linux-specific code goes here.
       ))

;; Remove unnecessary info from modeline
(use-package diminish)

;; Color themes
;;(use-package solarized-theme)
(use-package gruvbox-theme)
;;(use-package darktooth-theme)

;; Session saving
(use-package desktop
  :config
  (desktop-save-mode 1))

;; How to uniquify repeated filenames
(use-package uniquify
  :ensure nil
  :config
  (setq uniquify-after-kill-buffer-p t)
  (setq uniquify-buffer-name-style 'post-forward)
  (setq uniquify-strip-common-suffix nil))

;; Load PATH from the shell, on the Mac only
(use-package exec-path-from-shell
  :if (memq window-system '(mac ns))
  :config
  (exec-path-from-shell-initialize))

;; Better multiple-choice selection
(use-package ido
  :config
  (ido-mode t)
  (ido-everywhere 1)
  (setq ido-use-virtual-buffers t)
  (setq ido-enable-flex-matching t)
  (setq ido-use-filename-at-point nil)
  (setq ido-auto-merge-work-directories-length -1))

(use-package ido-ubiquitous
  :config
  (ido-ubiquitous-mode 1))

;; Open recent files, with ido integration
(use-package recentf
  :init
  (defun ido-recentf-open ()
    "Use `ido-completing-read' to \\[find-file] a recent file"
    (interactive)
    (if (find-file (ido-completing-read "Find recent file: " recentf-list))
	(message "Opening file...")
      (message "Aborting")))

  :config
  (recentf-mode 1)
  (setq recentf-max-menu-items 50)
  (global-set-key "\C-x\ \C-r" 'ido-recentf-open))

(use-package ibuffer
  :config
  (global-set-key (kbd "C-x C-b") 'ibuffer))

;; IDO-like interface for M-x
(use-package smex
  :bind (("M-x" . smex))
  :config (smex-initialize))

;; Clojure code editing
(use-package clojure-mode
  :mode "\\.clj.*$"
  :mode "riemann.config"
  :mode "\\.boot"
  :config
  ;; Boot script files using shebang (https://github.com/boot-clj/boot/wiki/For-Emacs-Users)
  (add-to-list 'magic-mode-alist '(".* boot" . clojure-mode)))

(use-package clojure-mode-extra-font-locking)

;; Clojure REPL
(use-package cider
  :config
  ;; nice pretty printing
  (setq cider-repl-use-pretty-printing nil)

  ;; nicer font lock in REPL
  (setq cider-repl-use-clojure-font-lock t)

  ;; result prefix for the REPL
  (setq cider-repl-result-prefix "; => ")

  ;; never ending REPL history
  (setq cider-repl-wrap-history t)

  ;; looong history
  (setq cider-repl-history-size 5000)

  ;; persistent history
  (setq cider-repl-history-file "~/.emacs.d/cider-history")
  
  ;; error buffer not popping up
  (setq cider-show-error-buffer nil)

  ;; go right to the REPL buffer when it's finished connecting
  (setq cider-repl-pop-to-buffer-on-connect t)
  )

;; clj-refactor
(use-package clj-refactor
  :config
  (defun my-clojure-mode-hook ()
    (clj-refactor-mode 1)
    (yas-minor-mode 1) ; for adding require/use/import statements
    ;; This choice of keybinding leaves cider-macroexpand-1 unbound
    (cljr-add-keybindings-with-prefix "C-c C-m"))

  (add-hook 'clojure-mode-hook #'my-clojure-mode-hook))

;; Clojure cheatsheet
(use-package helm)
(use-package clojure-cheatsheet
  :config
  (eval-after-load 'clojure-mode
    '(progn
       (define-key clojure-mode-map (kbd "C-c C-h") #'clojure-cheatsheet))))

;; Make parenthesis more readable
(use-package rainbow-delimiters
  :config
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
  (add-hook 'cider-repl-mode-hook #'rainbow-delimiters-mode))

;; Make parenthesis more manageable
(use-package smartparens
  :diminish smartparens-mode
  :config
  (require 'smartparens-config)
  (setq sp-base-key-bindings 'paredit)
  (add-hook 'clojure-mode-hook #'smartparens-strict-mode)
  (add-hook 'emacs-lisp-mode-hook #'smartparens-strict-mode)
  (add-hook 'lisp-mode-hook #'smartparens-strict-mode)
  (add-hook 'cider-repl-mode-hook #'smartparens-strict-mode)
  
  ;; Map M-( to enclose the next expression, as in paredit. Prefix
  ;; argument can be used to indicate how many expressions to enclose
  ;; instead of just 1. E.g. C-u 3 M-( will enclose the next 3 sexps.
  (defun sp-enclose-next-sexp (num) (interactive "p") (insert-parentheses (or num 1)))
  (add-hook 'smartparens-mode-hook #'sp-use-paredit-bindings)
  (add-hook 'smartparens-mode-hook (lambda () (local-set-key (kbd "M-(") 'sp-enclose-next-sexp))))

;; hl-sexp: minor mode to highlight s-expression
(use-package hl-sexp
  :config
  (add-hook 'clojure-mode-hook #'hl-sexp-mode)
  (add-hook 'lisp-mode-hook #'hl-sexp-mode)
  (add-hook 'emacs-lisp-mode-hook #'hl-sexp-mode))

;; Navigate SubWordsInCamelCase
(use-package subword
  :config
  (add-hook 'clojure-mode-hook #'subword-mode))

;; Keep indentation always updated
(use-package aggressive-indent
  :diminish aggressive-indent-mode
  :config
  (add-hook 'prog-mode-hook #'aggressive-indent-mode))

;; Auto-completion mode
(use-package company
  :diminish company-mode
  :config
  (add-hook 'after-init-hook #'global-company-mode)
  ;; company mode for completion
  (add-hook 'cider-repl-mode-hook #'company-mode)
  (add-hook 'cider-mode-hook #'company-mode))

;; Project mode
(use-package projectile
  :diminish projectile-mode
  :config
  (projectile-global-mode))

;; Edit multiple regions in the same way simultaneously.
(use-package iedit
  :config (set-face-background 'iedit-occurrence "Magenta"))

;; built-in documentation mode
(use-package eldoc
  :config
  (add-hook 'prog-mode-hook #'turn-on-eldoc-mode)
  (add-hook 'cider-repl-mode-hook #'turn-on-eldoc-mode))

;; CFEngine mode
(use-package cfengine
  :commands cfengine3-mode
  :mode ("\\.cf\\'" . cfengine3-mode))

;; CPerl mode - doesn't auto-set the mode for some reason
(use-package cperl-mode
  :mode "\\.p[lm]\\'"
  :interpreter "perl"
  :config
  (setq cperl-hairy t))

;; Flyspell
(use-package flyspell
  :config
  (define-key flyspell-mouse-map [down-mouse-3] #'flyspell-correct-word)
  (define-key flyspell-mouse-map [mouse-3] #'undefined)
  (add-hook 'text-mode-hook   'flyspell-mode))

;; midnight mode purges buffers which haven't been displayed in 3 days
(use-package midnight
  :config
  (setq midnight-mode 't)
  ;; From https://www.emacswiki.org/emacs/MidnightMode
  (setq midnight-period 7200) ;; (eq (* 2 60 60) "2 hours")
  )

;; mode for editing fish shell scripts
(use-package fish-mode
  :mode "\\.fish\\'"
  :interpreter "fish")

;; unfill paragraphs
(use-package unfill)

;; AsciiDoc
(use-package adoc-mode
  :mode "\\.asciidoc\\'"
  :config
  (define-key adoc-mode-map (kbd "M-]") 'increment-clojure-cookbook)
  (define-key adoc-mode-map (kbd "M-[") 'decrement-clojure-cookbook)
  (add-hook 'adoc-mode-hook 'cider-mode))

;; Markdown
(use-package markdown-mode)

;; Smart quotes
(use-package typopunct
  :config
  (typopunct-change-language 'english t))

;; Visual (soft) paragraph fill
;; https://www.emacswiki.org/emacs/VisualLineMode
;; (use-package visual-fill-column
;;   :config
;;   (add-hook 'adoc-mode-hook 'visual-fill-column-mode)
;;   (add-hook 'adoc-mode-hook 'visual-line-mode)
;;   (setq visual-line-fringe-indicators '(left-curly-arrow right-curly-arrow)))

(use-package saveplace
  :config
  (setq-default save-place t)
  ;; keep track of saved places in ~/.emacs.d/places
  (setq save-place-file (concat user-emacs-directory "places")))

;; Lua mode
(use-package lua-mode)

;; YAML mode
(use-package yaml-mode)

;; ;; Eshell mode
;; (use-package eshell
;;   :config
;;   (add-hook 'eshell-mode-hook #'eshell-smart-initialize)

;;   ;; From http://www.howardism.org/Technical/Emacs/eshell-fun.htm
;;   (defun eshell-here ()
;;     "Opens up a new shell in the directory associated with the
;; current buffer's file. The eshell is renamed to match that
;; directory to make multiple eshell windows easier."
;;     (interactive)
;;     (let* ((parent (if (buffer-file-name)
;;                        (file-name-directory (buffer-file-name))
;;                      default-directory))
;;            (height (/ (window-total-height) 2))
;;            (name   (car (last (split-string parent "/" t)))))
;;       (split-window-vertically (- height))
;;       (other-window 1)
;;       (eshell "new")
;;       (rename-buffer (concat "*eshell: " name "*"))

;;       (insert (concat "ls"))
;;       (eshell-send-input)))

;;   (global-set-key (kbd "C-!") 'eshell-here)

;;   (add-hook 'eshell-mode-hook
;;             (lambda ()
;;               (add-to-list 'eshell-visual-commands "ssh")
;;               (add-to-list 'eshell-visual-commands "tail"))))
;; (use-package shell-switcher
;;   :config
;;   (shell-switcher-mode))
;; (use-package eshell-git-prompt
;;   :config
;;   (eshell-git-prompt-use-theme 'robbyrussell))

;; Track Emacs usage achievements, just for fun
;; (use-package achievements
;;   :diminish achievements-mode
;;   :config
;;   (achievements-mode))

;; Make the mark visible
(use-package visible-mark)

;; Supercharged imenu mode
(use-package imenu-anywhere
  :config
  (global-set-key (kbd "M-i") 'ido-imenu-anywhere))

;; Keep context around when scrolling
(use-package smooth-scrolling
  :config
  (smooth-scrolling-mode 1))

;; Magit
(use-package magit)

;; Ack
(use-package ack)

;; AppleScript
(use-package applescript-mode)

;; NeoTree
(use-package neotree
  :config
  (setq neo-smart-open t)
  (setq projectile-switch-project-action 'neotree-projectile-action)
  (defun neotree-project-dir ()
    "Open NeoTree using the git root."
    (interactive)
    (let ((project-dir (projectile-project-root))
          (file-name (buffer-file-name)))
      (neotree-toggle)
      (if project-dir
          (if (neo-global--window-exists-p)
              (progn
                (neotree-dir project-dir)
                (neotree-find file-name)))
        (message "Could not find git project root."))))
  (global-set-key [f8] 'neotree-project-dir))

;; WordCount
(use-package wc-mode)

;; Clojure cookbook
(defun incdec-clojure-cookbook (op)
  "When reading the Clojure cookbook, change to a new section, and
close the buffer. If the next section is a sub-directory or in
the next chapter, open Dired so you can find it manually."
  (interactive)
  (let* ((cur (buffer-name))
         (split-cur (split-string cur "[-_]"))
         (chap (car split-cur))
         (rec (car (cdr split-cur)))
         (rec-num (string-to-number rec))
         (next-rec-num (+ op rec-num))
         (next-rec-s (number-to-string next-rec-num))
         (next-rec (if (< next-rec-num 10)
                       (concat "0" next-rec-s)
                     next-rec-s))
         (target (file-name-completion (concat chap "-" next-rec) "")))
    (progn 
      (if (equal target nil)
          (dired (file-name-directory (buffer-file-name)))
        (find-file target))
      (kill-buffer cur))))

(defun increment-clojure-cookbook ()
  "When reading the Clojure cookbook, find the next section, and
close the buffer. If the next section is a sub-directory or in
the next chapter, open Dired so you can find it manually."
  (interactive)
  (incdec-clojure-cookbook 1))

(defun decrement-clojure-cookbook ()
  "When reading the Clojure cookbook, find the previous section, and
close the buffer. If the next section is a sub-directory or in
the next chapter, open Dired so you can find it manually."
  (interactive)
  (incdec-clojure-cookbook -1))

;; From https://www.emacswiki.org/emacs/RandomizeBuffer
(defun my-randomize-region (beg end)
  "Randomize lines in region from BEG to END."
  (interactive "*r")
  (let ((lines (split-string
                (delete-and-extract-region beg end) "\n")))
    (when (string-equal "" (car (last lines 1)))
      (setq lines (butlast lines 1)))
    (apply 'insert
           (mapcar 'cdr
                   (sort (mapcar (lambda (x) (cons (random) (concat x "\n"))) lines)
                         (lambda (a b) (< (car a) (car b))))))))

(provide '.emacs)
