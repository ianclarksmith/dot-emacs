(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:height 180 :family "Inconsolata"))))
 '(markup-meta-face ((t (:foreground "gray40" :height 140 :family "Inconsolata")))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Miscellaneous config

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

;; Color theme
(use-package color-theme
  :config
  (color-theme-initialize)
  (use-package color-theme-solarized
    :config (color-theme-solarized)))

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
  :mode "riemann.config")

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

  ;; error buffer not popping up
  (setq cider-show-error-buffer nil)

  ;; go right to the REPL buffer when it's finished connecting
  (setq cider-repl-pop-to-buffer-on-connect t)
  )

;; Make parenthesis more readable
(use-package rainbow-delimiters
  :config
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))

;; Make parenthesis more manageable
(use-package smartparens
  :diminish smartparens-mode
  :config
  (require 'smartparens-config)
  (setq sp-base-key-bindings 'paredit)
  (add-hook 'clojure-mode-hook #'smartparens-strict-mode)
  (add-hook 'emacs-lisp-mode-hook #'smartparens-strict-mode)

  ;; Map M-( to enclose the next expression, as in paredit. Prefix
  ;; argument can be used to indicate how many expressions to enclose
  ;; instead of just 1. E.g. C-u 3 M-( will enclose the next 3 sexps.
  (defun sp-enclose-next-sexp (num) (interactive "p") (insert-parentheses (or num 1)))
  (add-hook 'clojure-mode-hook (lambda () (local-set-key (kbd "M-(") 'sp-enclose-next-sexp))))

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
  (add-hook 'cider-mode-hook #'company-mode)
  )

;; Project mode
(use-package projectile
  :diminish projectile-mode
  :config
  (projectile-global-mode))

;; Edit multiple regions in the same way simultaneously.
(use-package iedit
  :config (set-face-background 'iedit-occurrence "Magenta"))

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
  (setq midnight-mode 't))

;; mode for editing fish shell scripts
(use-package fish-mode
  :mode "\\.fish\\'"
  :interpreter "fish")

;; unfill paragraphs
(use-package unfill)

;; AsciiDoc
(use-package adoc-mode
  :mode "\\.asciidoc\\'")

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

(provide '.emacs)
