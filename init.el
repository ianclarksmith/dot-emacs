;; DO NOT EDIT THIS FILE DIRECTLY
;; This is a file generated from a literate programing source file located at
;; https://github.com/zzamboni/dot-emacs/blob/master/init.org.
;; You should make any changes there and regenerate it from Emacs org-mode using C-c C-v t

;; Use a hook so the message doesn't get clobbered by other messages.
(add-hook 'emacs-startup-hook
          (lambda ()
            (message "Emacs ready in %s with %d garbage collections."
                     (format "%.2f seconds"
                             (float-time
                              (time-subtract after-init-time before-init-time)))
                     gcs-done)))

(let ((file-name-handler-alist nil))

(setq gc-cons-threshold most-positive-fixnum)

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

(require 'auth-source)
(require 'auth-source-pass)
(auth-source-pass-enable)

(customize-set-variable 'package-archives
                        '(;;("gnu"       . "https://elpa.gnu.org/packages/")
                          ("marmalade" . "https://marmalade-repo.org/packages/")
                          ("melpa"     . "https://melpa.org/packages/")))

(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(when (not (package-installed-p 'use-package))
  (package-install 'use-package))

(require 'use-package)

(customize-set-variable 'use-package-always-ensure t)

(customize-set-variable 'use-package-always-defer t)

(customize-set-variable 'load-prefer-newer t)
(use-package auto-compile
  :defer nil
  :config (auto-compile-on-load-mode))

(add-to-list 'load-path "~/.emacs.d/lisp")

(use-package paradox
  :defer nil
  :config
  (require 'paradox)
  (paradox-enable)
  (setq paradox-github-token (auth-source-pass-get 'secret "paradox-github-token"))
  :custom
  (paradox-automatically-star t))

(defun zz/set-proxy ()
  (interactive)
  (customize-set-variable 'url-proxy-services '(("http"  . "proxy.corproot.net:8079")
                                                ("https" . "proxy.corproot.net:8079"))))
(defun zz/unset-proxy ()
  (interactive)
  (customize-set-variable 'url-proxy-services nil))

(server-start)

(add-hook 'before-save-hook 'time-stamp)

(customize-set-variable 'kill-whole-line t)

(customize-set-variable 'mouse-yank-at-point t)

(setq completion-ignore-case t)
(customize-set-variable 'read-file-name-completion-ignore-case t)
(customize-set-variable 'read-buffer-completion-ignore-case t)

(when (>= emacs-major-version 26)
  (use-package display-line-numbers
    :disabled
    :defer nil
    :ensure nil
    :config
    (global-display-line-numbers-mode)))

(customize-set-variable 'show-trailing-whitespace t)

(show-paren-mode)

(customize-set-variable 'indent-tabs-mode nil)

(customize-set-variable 'backup-directory-alist `(("." . ,(concat user-emacs-directory "backups"))))

(when (fboundp 'winner-mode) (winner-mode))

(use-package unfill
  :bind
  ("M-q" . unfill-toggle)
  ("A-q" . unfill-paragraph))

(use-package saveplace
  :defer nil
  :config
  (save-place-mode))

(use-package imenu-anywhere
  :bind
  ("M-i" . helm-imenu-anywhere))

(use-package smooth-scrolling
  :config
  (smooth-scrolling-mode 1))

(add-hook 'before-save-hook 'delete-trailing-whitespace)

(customize-set-variable 'ad-redefinition-action 'accept)

(cond ((eq system-type 'darwin)
       (customize-set-variable 'mac-command-modifier 'meta)
       (customize-set-variable 'mac-option-modifier 'alt)
       (customize-set-variable 'mac-right-option-modifier 'super)
       (bind-key "M-+" 'text-scale-increase)
       (bind-key "M-=" 'text-scale-increase)
       (bind-key "M--" 'text-scale-decrease)
       (defun zz/text-scale-reset ()
         (interactive)
         (text-scale-set 0))
       (bind-key "M-0" 'zz/text-scale-reset)
       (use-package exec-path-from-shell
         :defer nil
         :config
         (exec-path-from-shell-initialize))
       )
      ((eq system-type 'windows-nt)
       
       )
      ((eq system-type 'gnu/linux)
       
       ))

(require 'bind-key)

(bind-key "M-g" 'goto-line)

(bind-key "M-`" 'other-frame)

(use-package pcre2el)
(use-package visual-regexp-steroids
  :custom
  (vr/engine 'pcre2el "Use PCRE regular expressions")
  :bind
  ("C-c r" . vr/replace)
  ("C-c q" . vr/query-replace)
  ("C-r"   . vr/isearch-backward)
  ("C-s"   . vr/isearch-forward)
  ("C-M-s" . isearch-forward)
  ("C-M-r" . isearch-backward))

(bind-key "M-/" 'hippie-expand)

(use-package which-key
  :defer nil
  :diminish which-key-mode
  :config
  (which-key-mode))

(defun zz/goto-match-paren (arg)
  "Go to the matching paren/bracket, otherwise (or if ARG is not nil) insert %.
  vi style of % jumping to matching brace."
  (interactive "p")
  (if (not (memq last-command '(set-mark
                                cua-set-mark
                                zz/goto-match-paren
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
                                back-to-indentation
                                )))
      (self-insert-command (or arg 1))
    (cond ((looking-at "\\s\(") (sp-forward-sexp) (backward-char 1))
          ((looking-at "\\s\)") (forward-char 1) (sp-backward-sexp))
          (t (self-insert-command (or arg 1))))))

(bind-key "%" 'zz/goto-match-paren)

(use-package org
  :pin manual
  :load-path ("lisp/org-mode/lisp" "lisp/org-mode/lisp/contrib/lisp")
  :bind
    ("C-c l" . org-store-link)
    ("C-c a" . org-agenda)
    ("A-h" . org-mark-element)
    ("C-c c" . org-capture)
  :custom
    (org-directory "~/Dropbox/org")
    (org-log-done t)
    (org-startup-indented t)
    (org-default-notes-file (concat org-directory "/notes.org"))
    (org-use-speed-commands (lambda () (and (looking-at org-outline-regexp) (looking-back "^\**"))))
    (org-confirm-babel-evaluate nil)
    (org-src-fontify-natively t)
    (org-src-tab-acts-natively t)
    (org-hide-emphasis-markers t)
  :custom-face
    (variable-pitch ((t (:family "Source Sans Pro" :height 160 :weight light))))
    ;;(variable-pitch ((t (:family "Avenir Next" :height 160 :weight light))))
    (fixed-pitch ((t (:family "Inconsolata"))))
  :hook
    (org-babel-after-execute . org-redisplay-inline-images)
    (org-mode . (lambda () (add-hook 'after-save-hook 'org-babel-tangle
                                     'run-at-end 'only-in-org-mode)))
    (org-babel-pre-tangle  . (lambda ()
                               (setq zz/pre-tangle-time (current-time))))
    (org-babel-post-tangle . (lambda ()
                               (message "org-babel-tangle took %s"
                                               (format "%.2f seconds"
                                                       (float-time (time-since zz/pre-tangle-time))))))
    (org-mode . visual-line-mode)
    (org-mode . variable-pitch-mode)
  :config
    (org-babel-do-load-languages
     'org-babel-load-languages
     '((cfengine3 . t)
       (ruby      . t)
       (latex     . t)
       (plantuml  . t)
       (python    . t)
       (shell     . t)
       (elvish    . t)
       (calc      . t)))
    (font-lock-add-keywords 'org-mode
                            '(("^ *\\([-]\\) "
                               (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))
    (let* ((variable-tuple
            (cond ((x-list-fonts   "Source Sans Pro") '(:font   "Source Sans Pro"))
                  ((x-list-fonts   "Lucida Grande")   '(:font   "Lucida Grande"))
                  ((x-list-fonts   "Verdana")         '(:font   "Verdana"))
                  ((x-family-fonts "Sans Serif")      '(:family "Sans Serif"))
                  (nil (warn "Cannot find a Sans Serif Font.  Install Source Sans Pro."))))
           (base-font-color (face-foreground 'default nil 'default))
           (headline       `(:inherit default :weight bold :foreground ,base-font-color)))
    
      (custom-theme-set-faces
       'user
       `(org-level-8        ((t (,@headline ,@variable-tuple))))
       `(org-level-7        ((t (,@headline ,@variable-tuple))))
       `(org-level-6        ((t (,@headline ,@variable-tuple))))
       `(org-level-5        ((t (,@headline ,@variable-tuple))))
       `(org-level-4        ((t (,@headline ,@variable-tuple :height 1.1))))
       `(org-level-3        ((t (,@headline ,@variable-tuple :height 1.25))))
       `(org-level-2        ((t (,@headline ,@variable-tuple :height 1.5))))
       `(org-level-1        ((t (,@headline ,@variable-tuple :height 1.75))))
       `(org-document-title ((t (,@headline ,@variable-tuple :height 2.0 :underline nil))))))
    (eval-after-load 'face-remap '(diminish 'buffer-face-mode))
    (eval-after-load 'simple '(diminish 'visual-line-mode)))

(use-package org-indent
  :ensure nil
  :diminish)

(use-package org-tempo
  :disabled
  :defer 5
  :ensure nil
  :after org)

(use-package ox-reveal
  :load-path ("lisp/org-reveal")
  :defer 3
  :after org
  :custom
  (org-reveal-note-key-char nil)
  (org-reveal-root "file:///Users/taazadi1/Dropbox/org/reveal.js"))
(use-package htmlize
  :defer 3
  :after ox-reveal)

(use-package ox-md
  :ensure nil
  :defer 3
  :after org)

(use-package ox-jira
  :defer 3
  :after org)
(use-package org-jira
  :defer 3
  :after org
  :custom
  (jiralib-url "https://jira.swisscom.com"))

(use-package ox-confluence
  :defer 3
  :ensure nil
  :after org)

(use-package ox-asciidoc
  :defer 3
  :after org)

(use-package ox-texinfo
  :load-path "lisp/org-mode/lisp"
  :defer 3
  :ensure nil
  :after org)

(use-package ox-latex
  :load-path "lisp/org-mode/lisp"
  :ensure nil
  :demand
  :after org
  :custom
  (org-latex-compiler "lualatex")
  (org-latex-pdf-process '("%latex -shell-escape -interaction nonstopmode -output-directory %o %f" "%latex -interaction nonstopmode -output-directory %o %f" "%latex -interaction nonstopmode -output-directory %o %f"))
  :config
  (setq org-latex-listings 'minted)
  (add-to-list 'org-latex-packages-alist '("newfloat" "minted"))
  (add-to-list 'org-latex-minted-langs '(lua "lua"))
  (add-to-list 'org-latex-minted-langs '(shell "shell"))
  (add-to-list 'org-latex-classes '("book-no-parts" "\\documentclass[11pt]{book}"
                                    ("\\chapter{%s}" . "\\chapter*{%s}")
                                    ("\\section{%s}" . "\\section*{%s}")
                                    ("\\subsection{%s}" . "\\subsection*{%s}")
                                    ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                                    ("\\paragraph{%s}" . "\\paragraph*{%s}")))
  ;; Necessary for LuaLaTeX to work - see https://tex.stackexchange.com/a/374391/10680
  (setenv "LANG" "en_US.UTF-8"))

(use-package ox-hugo
  :defer 3
  :after org)

(use-package org-capture
  :ensure nil
  :config
  (defun org-hugo-new-subtree-post-capture-template ()
    "Returns `org-capture' template string for new Hugo post.
  See `org-capture-templates' for more information."
    (let* ((title (read-from-minibuffer "Post Title: ")) ;Prompt to enter the post title
           (fname (org-hugo-slug title)))
      (mapconcat #'identity
                 `(,(concat "* TODO " title)
                   ":PROPERTIES:"
                   ,(concat ":EXPORT_HUGO_BUNDLE: " fname)
                   ":EXPORT_FILE_NAME: index"
                   ":END:"
                   "%?\n")                ;Place the cursor here finally
                 "\n")))
  (add-to-list 'org-capture-templates
               '("z"                ;`org-capture' binding + z
                 "zzamboni.org post"
                 entry
                 ;; It is assumed that below file is present in `org-directory'
                 ;; and that it has an "Ideas" heading. It can even be a
                 ;; symlink pointing to the actual location of all-posts.org!
                 (file+olp "zzamboni.org" "Ideas")
                 (function org-hugo-new-subtree-post-capture-template))))

(use-package org-capture
  :ensure nil
  :config
  (defun modi/org-capture--remove-auto-org-to-hugo-export-maybe ()
    "Function for `org-capture-before-finalize-hook'.
  Disable `org-hugo-export-wim-to-md-after-save'."
    (setq org-hugo-allow-export-after-save nil))
  (defun modi/org-capture--add-auto-org-to-hugo-export-maybe ()
    "Function for `org-capture-after-finalize-hook'.
  Enable `org-hugo-export-wim-to-md-after-save'."
    (setq org-hugo-allow-export-after-save t))
  (add-hook 'org-capture-before-finalize-hook #'modi/org-capture--remove-auto-org-to-hugo-export-maybe)
  (add-hook 'org-capture-after-finalize-hook #'modi/org-capture--add-auto-org-to-hugo-export-maybe))

(use-package org-journal
  :after org
  :custom
  (org-journal-dir "~/Documents/logbook"))

(use-package ob-cfengine3
  :after org)

(use-package ob-elvish
  :after org)

(require 'subr-x)
(setq homebrew-plantuml-jar-path
      (expand-file-name (string-trim (shell-command-to-string "brew list plantuml | grep jar"))))

(use-package plantuml-mode
  :custom
  (plantuml-jar-path homebrew-plantuml-jar-path))

(use-package ob-plantuml
  :ensure nil
  :after org
  :custom
  (org-plantuml-jar-path homebrew-plantuml-jar-path))

(use-package org-bullets
  :after org
  :hook
  (org-mode . (lambda () (org-bullets-mode 1))))

(use-package toc-org
  :after org
  :hook
  (org-mode . toc-org-enable))

(use-package org-mac-link
  :ensure nil
  :load-path "lisp/org-mode/contrib/lisp"
  :after org
  :bind (:map org-mode-map
              ("C-c g" . org-mac-grab-link)))

(defun zz/org-reformat-buffer ()
  (interactive)
  (when (y-or-n-p "Really format current buffer? ")
    (let ((document (org-element-interpret-data (org-element-parse-buffer))))
      (erase-buffer)
      (insert document)
      (goto-char (point-min)))))

(defun afs/org-replace-link-by-link-description ()
    "Replace an org link by its description or if empty its address"
  (interactive)
  (if (org-in-regexp org-bracket-link-regexp 1)
      (let ((remove (list (match-beginning 0) (match-end 0)))
        (description (if (match-end 3)
                 (org-match-string-no-properties 3)
                 (org-match-string-no-properties 1))))
    (apply 'delete-region remove)
    (insert description))))
(bind-key "C-c C-M-u" 'afs/org-replace-link-by-link-description)

(use-package yasnippet)
(use-package yankpad
  :init
  (setq yankpad-file (concat org-directory "/yankpad.org"))
  :bind
  ([f7]  . yankpad-map)
  ([f12] . yankpad-expand)
  :config
  ;; If you want to expand snippets with hippie-expand
  (add-to-list 'hippie-expand-try-functions-list #'yankpad-expand))

(defun org-latex-publish-to-latex-and-open (plist file pub-dir)
  (org-open-file (org-latex-publish-to-pdf plist file pub-dir)))

(when (>= emacs-major-version 26)
  (pixel-scroll-mode))

(use-package diminish
  :defer 1)

;;(use-package solarized-theme)
;;(use-package darktooth-theme)
;;(use-package kaolin-themes)
(use-package gruvbox-theme)
(load-theme 'gruvbox)

(use-package smart-mode-line
  :defer 2
  :config
  (sml/setup)
  :custom
  (sml/theme 'dark)
  (sml/replacer-regexp-list
   '(("^~/\\.emacs\\.d/elpa/"                            ":ELPA:")
     ("^~/\\.emacs\\.d/"                                 ":ED:")
     ("^/sudo:.*:"                                       ":SU:")
     ("^~/Documents/"                                    ":Doc:")
     ("^:\\([^:]*\\):Documento?s/"                       ":\\1/Doc:")
     ("^~/Dropbox/"                                      ":DB:")
     ("^:DB:org"                                         ":Org:")
     ("^:DB:Personal/"                                   ":P:")
     ("^:DB:Personal/writing/"                           ":Write:")
     ("^:P:devel/"                                       ":Dev:")
     ("^:Write:learning-cfengine-3/learning-cfengine-3/" ":cf-learn:")
     ("^:Dev:go/src/github.com/elves/elvish/"            ":elvish:")
     ("^:Dev:zzamboni.org/zzamboni.org/"                 ":zz.org:"))))

(use-package desktop
  :defer nil
  :custom
  (desktop-restore-eager   1   "Restore only the first buffer right away")
  (desktop-lazy-idle-delay 1   "Restore the rest of the buffers 1 seconds later")
  (desktop-lazy-verbose    nil "Be silent about lazily opening buffers")
  :bind
  ("C-M-s-k" . desktop-clear)
  :config
  (desktop-save-mode))

(use-package uniquify
  :defer 1
  :ensure nil
  :custom
  (uniquify-after-kill-buffer-p t)
  (uniquify-buffer-name-style 'post-forward)
  (uniquify-strip-common-suffix t))

(use-package hl-line
  :disabled
  :defer nil
  :config
  (global-hl-line-mode))
(use-package col-highlight
  :disabled
  :defer nil
  :config
  (col-highlight-toggle-when-idle)
  (col-highlight-set-interval 2))
(use-package crosshairs
  :disabled
  :defer nil
  :config
  (crosshairs-mode))

(use-package recentf
  :defer 1
  :custom
  (recentf-max-menu-items 100)
  (recentf-max-saved-items 100)
  :init
  (recentf-mode))

(use-package ibuffer
  :disabled
  :bind
  ("C-x C-b" . ibuffer))

(use-package smex
  :disabled
  :bind (("M-x" . smex))
  :config (smex-initialize))

(use-package midnight
  :defer 3
  :config
  (setq midnight-period 7200)
  (midnight-mode 1))

(use-package writeroom-mode)

(use-package neotree
  :config
  (customize-set-variable 'neo-theme (if (display-graphic-p) 'icons 'arrow))
  (customize-set-variable 'neo-smart-open t)
  (customize-set-variable 'projectile-switch-project-action 'neotree-projectile-action)
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
  :bind
  ([f8] . neotree-project-dir))

(use-package wc-mode
  :defer 3)

(use-package all-the-icons
  :defer 3)

(use-package ido
  :disabled
  :config
  (ido-mode t)
  (ido-everywhere 1)
  (setq ido-use-virtual-buffers t)
  (setq ido-enable-flex-matching t)
  (setq ido-use-filename-at-point nil)
  (setq ido-auto-merge-work-directories-length -1))

(use-package ido-completing-read+
  :disabled
  :config
  (ido-ubiquitous-mode 1))

(use-package helm
  :defer 1
  :diminish helm-mode
  :bind
  (("C-x C-f"       . helm-find-files)
   ("C-x C-b"       . helm-buffers-list)
   ("C-x b"         . helm-multi-files)
   ("M-x"           . helm-M-x)
   :map helm-find-files-map
   ("C-<backspace>" . helm-find-files-up-one-level)
   ("C-f"           . helm-execute-persistent-action)
   ([tab]           . helm-ff-RET))
  :config
  (defun daedreth/helm-hide-minibuffer ()
    (when (with-helm-buffer helm-echo-input-in-header-line)
      (let ((ov (make-overlay (point-min) (point-max) nil nil t)))
        (overlay-put ov 'window (selected-window))
        (overlay-put ov 'face
                     (let ((bg-color (face-background 'default nil)))
                       `(:background ,bg-color :foreground ,bg-color)))
        (setq-local cursor-type nil))))
  (add-hook 'helm-minibuffer-set-up-hook 'daedreth/helm-hide-minibuffer)
  (setq helm-autoresize-max-height 0
        helm-autoresize-min-height 40
        helm-M-x-fuzzy-match t
        helm-buffers-fuzzy-matching t
        helm-recentf-fuzzy-match t
        helm-semantic-fuzzy-match t
        helm-imenu-fuzzy-match t
        helm-split-window-in-side-p nil
        helm-move-to-line-cycle-in-source nil
        helm-ff-search-library-in-sexp t
        helm-scroll-amount 8
        helm-echo-input-in-header-line nil)
  :init
  (helm-mode 1))

  (require 'helm-config)
  (helm-autoresize-mode 1)

  (use-package helm-flx
    :custom
    (helm-flx-for-helm-find-files t)
    (helm-flx-for-helm-locate t)
    :config
    (helm-flx-mode +1))

(use-package subword
  :hook
  (clojure-mode . subword-mode))

(use-package aggressive-indent
  :disabled
  :diminish aggressive-indent-mode
  :hook
  (prog-mode . aggressive-indent-mode)
  (python-mode . (lambda () (aggressive-indent-mode -1))))

(use-package company
  :diminish company-mode
  :hook
  (after-init . global-company-mode))

(use-package projectile
  :defer 2
  :diminish projectile-mode
  :config
  (projectile-global-mode))

(use-package iedit
  :config (set-face-background 'iedit-occurrence "Magenta"))

(use-package eldoc
  :diminish
  :hook
  (prog-mode       . turn-on-eldoc-mode)
  (cider-repl-mode . turn-on-eldoc-mode))

(use-package flyspell
  :defer 1
  :hook (text-mode . flyspell-mode)
  :diminish
  :bind (:map flyspell-mouse-map
              ([down-mouse-3] . #'flyspell-correct-word)
              ([mouse-3]      . #'undefined)))

(use-package clojure-mode
  :mode "\\.clj.*$"
  :mode "riemann.config"
  :mode "\\.boot"
  :config
  (add-to-list 'magic-mode-alist '(".* boot" . clojure-mode)))

(use-package clojure-mode-extra-font-locking)

(use-package cider
  :custom
  ;; nice pretty printing
  (cider-repl-use-pretty-printing nil)
  ;; nicer font lock in REPL
  (cider-repl-use-clojure-font-lock t)
  ;; result prefix for the REPL
  (cider-repl-result-prefix "; => ")
  ;; never ending REPL history
  (cider-repl-wrap-history t)
  ;; looong history
  (cider-repl-history-size 5000)
  ;; persistent history
  (cider-repl-history-file "~/.emacs.d/cider-history")
  ;; error buffer not popping up
  (cider-show-error-buffer nil)
  ;; go right to the REPL buffer when it's finished connecting
  (cider-repl-pop-to-buffer-on-connect t))

(use-package clj-refactor
  :config
  (defun my-clojure-mode-hook ()
    (clj-refactor-mode 1)
    (yas-minor-mode 1) ; for adding require/use/import statements
    ;; This choice of keybinding leaves cider-macroexpand-1 unbound
    (cljr-add-keybindings-with-prefix "C-c C-m"))
  :hook
  (clojure-mode . my-clojure-mode-hook))

(use-package rainbow-delimiters
  :hook
  ((prog-mode cider-repl-mode) . rainbow-delimiters-mode))

(defun zz/sp-enclose-next-sexp (num) (interactive "p") (insert-parentheses (or num 1)))
(use-package smartparens
  :diminish smartparens-mode
  :config
  (require 'smartparens-config)
  :custom
  (sp-base-key-bindings 'paredit)
  :hook
  ((clojure-mode
    emacs-lisp-mode
    lisp-mode
    cider-repl-mode) . smartparens-strict-mode)
  (smartparens-mode  . sp-use-paredit-bindings)
  (smartparens-mode  . (lambda () (local-set-key (kbd "M-(") 'zz/sp-enclose-next-sexp))))

(use-package hl-sexp
  :hook
  ((clojure-mode lisp-mode emacs-lisp-mode) . hl-sexp-mode))

(use-package lispy
  :disabled
  :config
  (defun enable-lispy-mode () (lispy-mode 1))
  :hook
  ((clojure-mode
    emacs-lisp-mode
    common-lisp-mode
    scheme-mode
    lisp-mode) . enable-lispy-mode))

(use-package parinfer
  :disabled
  :bind
  (("C-," . parinfer-toggle-mode))
  :init
  (setq parinfer-extensions
        '(defaults       ; should be included.
           pretty-parens  ; different paren styles for different modes.
           ;;evil           ; If you use Evil.
           lispy          ; If you use Lispy. With this extension, you should install Lispy and do not enable lispy-mode directly.
           paredit        ; Introduce some paredit commands.
           smart-tab      ; C-b & C-f jump positions and smart shift with tab & S-tab.
           smart-yank))   ; Yank behavior depend on mode.
  :hook
  ((clojure-mode
    emacs-lisp-mode
    common-lisp-mode
    scheme-mode
    lisp-mode) . parinfer-mode))

(use-package cfengine
  :commands cfengine3-mode
  :mode ("\\.cf\\'" . cfengine3-mode))

(use-package cperl-mode
  :mode "\\.p[lm]\\'"
  :interpreter "perl"
  :config
  (setq cperl-hairy t))

(use-package fish-mode
  :mode "\\.fish\\'"
  :interpreter "fish")

(use-package lua-mode)

(use-package yaml-mode)

(use-package applescript-mode)

(use-package go-mode)

(use-package package-build)
(use-package package-lint)

(use-package elvish-mode)

(use-package racket-mode)

(use-package nix-mode)

(use-package magit
  :diminish auto-revert-mode
  :bind
  (("C-c C-g" . magit-status)
   :map magit-status-mode-map
   ("q"       . magit-quit-session))
  :config
  (defadvice magit-status (around magit-fullscreen activate)
    "Make magit-status run alone in a frame."
    (window-configuration-to-register :magit-fullscreen)
    ad-do-it
    (delete-other-windows))

  (defun magit-quit-session ()
    "Restore the previous window configuration and kill the magit buffer."
    (interactive)
    (kill-buffer)
    (jump-to-register :magit-fullscreen)))

(use-package ag)

(use-package easy-hugo
  :custom
  (easy-hugo-basedir "~/Personal/devel/zzamboni.org/zzamboni.org/")
  (easy-hugo-url "http://zzamboni.org/")
  (easy-hugo-previewtime "300")
  ;;(define-key global-map (kbd "C-c C-e") 'easy-hugo)
  )

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

(use-package autoinsert
  :ensure nil
  :custom
  (auto-insert-directory (concat user-emacs-directory "auto-insert/"))
  :hook
  (find-file . auto-insert))

(use-package gist
  :custom
  (gist-view-gist t "Automatically open new gists in browser"))

(use-package esup)

(defmacro measure-time (&rest body)
  "Measure the time it takes to evaluate BODY."
  `(let ((time (current-time)))
     ,@body
     (message "%.06f" (float-time (time-since time)))))

(use-package adoc-mode
  :mode "\\.asciidoc\\'"
  :hook
  (adoc-mode . visual-line-mode)
  (adoc-mode . variable-pitch-mode))

(use-package markdown-mode
  :hook
  (markdown-mode . visual-line-mode)
  (markdown-mode . variable-pitch-mode))

(use-package typopunct
  :config
  (typopunct-change-language 'english t))

)

(setq gc-cons-threshold (* 2 1000 1000))
