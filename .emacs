;;; .emacs --- Main Emacs config file

;;; Commentary:

;; Main entry point for Emacs configuration. Work-in-progress wrt
;; refactoring, cleanup and better structuring.

;;; Code:

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(add-log-mailing-address "diego@zzamboni.org")
 '(cfengine-parameters-indent (quote (promise pname 2)))
 '(cider-inject-dependencies-at-jack-in nil)
 '(coffee-tab-width 2)
 '(column-enforce-comments nil)
 '(column-number-mode t)
 '(global-column-enforce-mode t)
 '(indent-tabs-mode nil)
 '(indicate-empty-lines t)
 '(markdown-command "/Users/a10022/bin/markdown")
 '(markdown-footnote-location (quote immediately))
 '(markdown-hr-string "-------")
 '(markdown-link-space-sub-char "-")
 '(perl-prettify-symbols nil)
 '(safe-local-variable-values
   (quote
    ((cperl-fix-hanging-brace-when-indent . t)
     (cperl-brace-imaginary-offset . 0)
     (cperl-close-paren-offset . -1))))
 '(save-place t nil (saveplace))
 '(show-paren-mode t)
 '(show-paren-style (quote mixed))
 '(size-indication-mode t)
 '(smartparens-global-mode t)
 '(tab-stop-list
   (quote
    (4 8 12 16 20 24 28 32 36 40 44 48 52 56 60 64 68 72 76 80 84 88 92 96 100 104 108 112 116 120)))
 '(tramp-encoding-shell "/bin/bash")
 '(uniquify-after-kill-buffer-p t)
 '(uniquify-buffer-name-style (quote post-forward) nil (uniquify))
 '(uniquify-strip-common-suffix nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#042028" :foreground "#708183" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 180 :width normal :foundry "apple" :family "Inconsolata"))))
 '(highlight ((t (:background "#073642"))))
 '(iedit-occurrence ((t (:background "Magenta"))))
 '(markup-meta-face ((t (:stipple nil :foreground "gray40" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 180 :width normal :foundry "unknown" :family "Inconsolata"))))
 '(show-paren-match ((t (:background "#073642" :inverse-video nil :underline nil :slant normal)))))

;; Clojure customizations from
;; https://github.com/flyingmachine/emacs-for-clojure.git and also
;; from https://github.com/clojure-emacs/example-config Include some
;; generically-good package management stuff, so I merged them here.

;; Define package repositories
(require 'package)
(package-initialize)
(add-to-list 'package-archives
     '("melpa-stable" . "http://stable.melpa.org/packages/") t)
;;(add-to-list 'package-archives
;;             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives
             '("tromey" . "http://tromey.com/elpa/") t)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)

(setq package-user-dir (concat user-emacs-directory "elpa"))
(add-to-list 'load-path (concat user-emacs-directory "site-lisp"))

;; Load and activate emacs packages. Do this first so that the
;; packages are loaded before you start trying to modify them.

(defun require-package (package &optional min-version no-refresh)
  "Install given PACKAGE, optionally requiring MIN-VERSION.
If NO-REFRESH is non-nil, the available package lists will not be
re-downloaded in order to locate PACKAGE."
  (if (package-installed-p package min-version)
      t
    (if (or (assoc package package-archive-contents) no-refresh)
        (package-install package)
      (progn
        (package-refresh-contents)
        (require-package package min-version t)))))

(setq package-enable-at-startup nil) ; Don't initialize later as well

(package-initialize)

;; This informs Emacs about the latest versions of all packages, and
;; makes them available for download.
(when (not package-archive-contents)
  (package-refresh-contents))

;; The packages you want installed. You can also install these
;; manually with M-x package-install
;; Add in your own as you wish:
(defvar my-packages
  '(;; makes handling lisp expressions much, much easier
    ;; Cheatsheet: http://www.emacswiki.org/emacs/PareditCheatsheet
    paredit

    ;; key bindings and code colorization for Clojure
    ;; https://github.com/clojure-emacs/clojure-mode
    clojure-mode

    ;; extra syntax highlighting for clojure
    clojure-mode-extra-font-locking

    ;; integration with a Clojure REPL
    ;; https://github.com/clojure-emacs/cider
    cider

    ;; allow ido usage in as many contexts as possible. see
    ;; customizations/navigation.el line 23 for a description
    ;; of ido
    ido-ubiquitous

    ;; Enhances M-x to allow easier execution of commands. Provides
    ;; a filterable list of possible commands in the minibuffer
    ;; http://www.emacswiki.org/emacs/Smex
    smex

    ;; project navigation
    projectile

    ;; colorful parenthesis matching
    rainbow-delimiters

    ;; edit html tags like sexps
    tagedit

    ;; git integration
    magit

    ))

(require-package 'epl)

;; On OS X, an Emacs instance started from the graphical user
;; interface will have a different environment than a shell in a
;; terminal window, because OS X does not run a shell during the
;; login. Obviously this will lead to unexpected results when
;; calling external utilities like make from Emacs.
;; This library works around this problem by copying important
;; environment variables from the user's shell.
;; https://github.com/purcell/exec-path-from-shell
(require-package 'exec-path-from-shell)
(if (eq system-type 'darwin)
    (add-to-list 'my-packages 'exec-path-from-shell))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))


;; Place downloaded elisp files in ~/.emacs.d/vendor. You'll then be able
;; to load them.
;;
;; For example, if you download yaml-mode.el to ~/.emacs.d/vendor,
;; then you can add the following code to this file:
;;
;; (require 'yaml-mode)
;; (add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
;; 
;; Adding this code will make Emacs enter yaml mode whenever you open
;; a .yml file
(add-to-list 'load-path "~/.emacs.d/vendor")


;;;;
;; Customization
;;;;

;; Add a directory to our load path so that when you `load` things
;; below, Emacs knows where to look for the corresponding file.
(add-to-list 'load-path "~/.emacs.d/customizations")

;; Sets up exec-path-from-shell so that Emacs will use the correct
;; environment variables
(load "shell-integration.el")

;; These customizations make it easier for you to navigate files,
;; switch buffers, and choose options from the minibuffer.
(load "navigation.el")

;; These customizations change the way emacs looks and disable/enable
;; some user interface elements
(load "ui.el")

;; These customizations make editing a bit nicer.
(load "editing.el")

;; Hard-to-categorize customizations
(load "misc.el")

;; For editing lisps
(load "elisp-editing.el")

;; Langauage-specific
(load "setup-clojure.el")
(load "setup-js.el")

(dolist (file '("cfg-flycheck.el"
		"cfg-hlsexp.el"
		"cfg-cider.el"
                ;"cfg-cljrefactor.el"
                ))
  (load file))

;; Custom User configurations:

;; If you wish to add additional functionality to your emacs config beyond what is in this setup,
;; simply add a file called "user-customizations.el" to your .emacs.d/lisp/ directory. Within that file,
;; you have access to the (require-package ...) function defined here, so for example, you could have:

;; (require-package 'rainbow-delimiters)

;; This would be all that is needed for emacs to automatically download the Rainbow Delimiters package
;; from Melpa. Additional configs of any kind could be added to this user-customizations.el file.
;; If the file is ommitted, no problem, no customizations are run.

;; (when (file-exists-p (concat dotfiles-lisp-dir "user-customizations.el"))
  ;; (load (concat dotfiles-lisp-dir "user-customizations.el")))

;; end clojure customizations
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(add-to-list 'load-path "/Users/a10022/.emacs.d/packages")
(require 'queue)
;; Predictive Completion
;; http://www.emacswiki.org/emacs/PredictiveMode
  (add-to-list 'load-path "~/.emacs.d/predictive")
  (add-to-list 'load-path "~/.emacs.d/predictive/html")
  (add-to-list 'load-path "~/.emacs.d/predictive/latex")
  (add-to-list 'load-path "~/.emacs.d/predictive/texinfo")

;; (autoload 'predictive-mode "predictive" "predictive" t)
;; (set-default 'predictive-auto-add-to-dict t)
;; (setq predictive-main-dict 'rpg-dictionary
;;       predictive-auto-learn t
;;       predictive-add-to-dict-ask nil
;;       predictive-use-auto-learn-cache nil
;;       predictive-which-dict t)

;; cfengine mode
;; These are from Ted Zlatanov's appendix to "Learning CFEngine 3"
(require 'cfengine)
(autoload 'cfengine3-mode "cfengine" "cfengine editing" t)
(add-to-list 'auto-mode-alist '("\\.cf\\'" . cfengine3-mode))

;; Set some CPerl parameters
(require 'cperl-mode)
(setq auto-mode-alist (cons '("\\.pl" . cperl-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.pm" . cperl-mode) auto-mode-alist))
(setq cperl-extra-newline-before-brace nil)
(setq cperl-hairy t)

;; ido mode, replaces iswitchb
(require 'ido)
(ido-mode t)
(setq ido-use-virtual-buffers t)

;; Timestamp
(add-hook 'before-save-hook 'time-stamp)

;; Flyspell
;; From http://stackoverflow.com/questions/10973000/emacs-23-4-mouse-2-behaviour-on-os-x-10-7
(require-package 'flyspell)
(require 'flyspell)
(eval-after-load "flyspell"
    '(progn
       (define-key flyspell-mouse-map [down-mouse-3] #'flyspell-correct-word)
       (define-key flyspell-mouse-map [mouse-3] #'undefined)))

;; TeX/LaTeX configuration.
(require-package 'reftex)
(require-package 'reftex-cite)
(require-package 'reftex-index)

(autoload 'reftex-mode    "reftex" "RefTeX Minor Mode" t)
(autoload 'turn-on-reftex "reftex" "RefTeX Minor Mode" t)
(autoload 'reftex-citation "reftex-cite" "Make citation" nil)
(autoload 'reftex-index-phrase-mode "reftex-index" "Phrase mode" t)

(autoload 'turn-on-bib-cite "bib-cite")
;; (setq bib-cite-use-reftex-view-crossref t)

;; Hooks for TeX/LaTeX files.
(add-hook 'TeX-mode-hook     'turn-on-auto-fill)
;(add-hook 'LaTeX-mode-hook   'turn-off-filladapt-mode)
(add-hook 'LaTeX-mode-hook   'font-lock-mode)
;;(add-hook 'LaTeX-mode-hook   'ispell-minor-mode)
(add-hook 'LaTeX-mode-hook   'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)   ; with AUCTeX LaTeX mode
;; Highlight \ref, \cite, etc.
(add-hook 'LaTeX-mode-hook 'turn-on-bib-cite)
;; Turn off the modeline display of the section name, which takes up
;; too much space in the modeline.
(add-hook 'LaTeX-mode-hook (lambda () (setq fume-display-in-modeline-p nil)))
;; PDF by default
(setq TeX-PDF-mode t)

;; Markdown mode: http://jblevins.org/projects/markdown-mode/
(autoload 'markdown-mode "markdown-mode.el" "Major mode for editing Markdown files" t)
(setq auto-mode-alist (cons '("\\.md" . markdown-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.markdown" . markdown-mode) auto-mode-alist))

;; Set ispell-parser correctly (this is recommended by flyspell)
;(add-hook 'tex-mode-hook (function (lambda () (setq ispell-parser 'tex))))

;; Some other hooks
;(add-hook 'text-mode-hook    'turn-on-filladapt-mode)
(add-hook 'text-mode-hook    'turn-on-auto-fill)
;(add-hook 'text-mode-hook   'flyspell-mode)

;; Make completion case-insensitive
(setq completion-ignore-case t)
(setq read-file-name-completion-ignore-case t)

;; key bindings
(global-set-key [(meta g)] 'goto-line)	;override set-face
(global-set-key [(meta \`)] 'other-frame)	;match the Mac "next app window" keybinding

;; When at the beginning of the line, Ctrl-K removes the whole
;; line, instead of just emptying it.
(setq kill-whole-line t)

;; Paste text where the cursor is, not where the mouse is.
(setq mouse-yank-at-point t)

;; From http://www.masteringemacs.org/articles/2011/10/02/improving-performance-emacs-display-engine/
;; (setq redisplay-dont-pause t)

(put 'downcase-region 'disabled nil)

;; Smart parenthesis handling
(require 'smartparens-config)
(smartparens-global-mode t)

;; From http://www.emacswiki.org/emacs/NavigatingParentheses
;; modified to use smartparens instead of the default commands
;; and to work on brackets and braces
(defun goto-match-paren (arg)
  "Go to the matching paren/bracket, otherwise (or if ARG is not nil) insert %.
vi style of % jumping to matching brace."
  (interactive "p")
  (if (not (memq last-command '(
                                set-mark
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

;; Make Command act as Meta, Option as Alt, right-Option as Super
(setq mac-command-modifier 'meta)
(setq mac-option-modifier 'alt)
(setq mac-right-option-modifier 'super)

;; midnight mode purges buffers which haven't been displayed in 3 days
(require 'midnight)
(setq midnight-mode 't)

;; iedit mode: http://www.masteringemacs.org/articles/2012/10/02/iedit-interactive-multi-occurrence-editing-in-your-buffer/
;(require 'iedit)
(global-set-key (kbd "C-;") 'iedit-mode)

;; save session state when you quit emacs
(desktop-save-mode 1)

;; originally from http://emacs.wordpress.com/2007/01/16/quick-and-dirty-code-folding/ and yhager
(defun tzz-selective-display ()
 "Activate selective display based on the indentation at point."
 (interactive)
 (set-selective-display
  (if selective-display
      nil
    (1+ (current-indentation)))))

(global-set-key [f1] 'tzz-selective-display)

(defun font-is-mono-p (font-family)
  "Return t if FONT-FAMILY is a monospace font, nil otherwise."
  ;; with-selected-window
  (let ((wind (selected-window))
        m-width l-width)
   (with-current-buffer "asdf"
     (set-window-buffer (selected-window) (current-buffer))
     (text-scale-set 4)
     (insert (propertize "l l l l l" 'face `((:family ,font-family))))
     (goto-char (line-end-position))
     (setq l-width (car (posn-x-y (posn-at-point))))
     (newline)
     (forward-line)
     (insert (propertize "m m m m m" 'face `((:family ,font-family) italic)))
     (goto-char (line-end-position))
     (setq m-width (car (posn-x-y (posn-at-point))))
     (eq l-width m-width))))
 
(defun compare-monospace-fonts ()
  "Display a list of all monospace font faces."
  (interactive)
  (pop-to-buffer "*Monospace Fonts*")
 
  (erase-buffer)
  (dolist (font-family (font-family-list))
    (when (font-is-mono-p font-family)
      (let ((str font-family))
        (newline)
        (insert
         (propertize (concat "The quick brown fox jumps over the lazy dog 1 l; 0 O o ("
                             font-family ")\n") 'face `((:family ,font-family)))
         (propertize (concat "The quick brown fox jumps over the lazy dog 1 l; 0 O o ("
                             font-family ")\n") 'face `((:family ,font-family) italic)))))))

;; http://www.emacswiki.org/emacs/WordCount
(autoload 'word-count-mode "word-count"
          "Minor mode to count words." t nil)
(global-set-key "\M-+" 'word-count-mode)

;; midnight mode purges buffers which haven't been displayed in 3 days
(require 'midnight)
(setq midnight-mode 't)

;; go mode: http://dominik.honnef.co/posts/2013/03/writing_go_in_emacs/
;(require 'go-mode-load)

;; From https://github.com/wwwjfy/emacs-fish/blob/master/fish-mode.el
(add-to-list 'auto-mode-alist '("\\.fish\\'" . fish-mode))
(add-to-list 'interpreter-mode-alist '("fish" . fish-mode))

(setq ns-use-srgb-colorspace t)

;;; From http://www.emacswiki.org/emacs/UnfillParagraph
;;; Stefan Monnier <foo at acm.org>.
(defun unfill-paragraph (&optional region)
  "Unfills the current multi-line paragraph (or selected REGION).
The opposite of `fill-paragraph' - unwraps text it into a single line of text."
  (interactive (progn (barf-if-buffer-read-only) '(t)))
  (let ((fill-column (point-max)))
    (fill-paragraph nil region)))

;; http://emacswiki.org/emacs/WinnerMode
(when (fboundp 'winner-mode)
  (winner-mode 1))

;; Lua mode
(require-package 'lua-mode)

(put 'narrow-to-region 'disabled nil)

;; Highlight long lines
(require 'column-enforce-mode)

;; AsciiDoc
(add-to-list 'auto-mode-alist (cons "\\.asciidoc\\'" 'adoc-mode))
;(add-hook 'adoc-mode-hook (lambda() (buffer-face-mode t)))

;(load-library "doc-mode")
;(autoload 'doc-mode "doc-mode")

(provide '.emacs)
;;; .emacs ends here
