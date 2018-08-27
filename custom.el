(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ad-redefinition-action (quote accept))
 '(auto-insert-directory "~/.emacs.d/auto-insert/")
 '(backup-directory-alist (quote (("." . "~/.emacs.d/backups"))))
 '(cfengine-indent 1)
 '(cider-repl-history-file "~/.emacs.d/cider-history" t)
 '(cider-repl-history-size 5000 t)
 '(cider-repl-pop-to-buffer-on-connect t t)
 '(cider-repl-result-prefix "; => " t)
 '(cider-repl-use-clojure-font-lock t t)
 '(cider-repl-use-pretty-printing nil t)
 '(cider-repl-wrap-history t t)
 '(cider-show-error-buffer nil t)
 '(column-number-mode t)
 '(custom-safe-themes
   (quote
    ("cd4d1a0656fee24dc062b997f54d6f9b7da8f6dc8053ac858f15820f9a04a679" "c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" "a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "6ac7c0f959f0d7853915012e78ff70150bfbe2a69a1b703c3ac4184f9ae3ae02" "8e4efc4bed89c4e67167fdabff77102abeb0b1c203953de1e6ab4d2e3a02939a" "a1a966cf2e87be6a148158c79863440ba2e45aa06cc214341feafe5c6deca4f2" "3eb2b5607b41ad8a6da75fe04d5f92a46d1b9a95a202e3f5369e2cdefb7aac5c" "3d0142352ce19c860047ad7402546944f84c270e84ae479beddbc2608268e0e5" "a33858123d3d3ca10c03c657693881b9f8810c9e242a62f1ad6380adf57b031c" "a40eac965142a2057269f8b2abd546b71a0e58e733c6668a62b1ad1aa7669220" "7be789f201ea16242dab84dd5f225a55370dbecae248d4251edbd286fe879cfa" "94dac4d15d12ba671f77a93d84ad9f799808714d4c5d247d5fd944df951b91d6" "4d8fab23f15347bce54eb7137789ab93007010fa47296c2f36757ff84b5b3c8a" default)))
 '(desktop-lazy-idle-delay 1)
 '(desktop-lazy-verbose nil)
 '(desktop-restore-eager 1)
 '(easy-hugo-basedir "~/Personal/devel/zzamboni.org/zzamboni.org/" t)
 '(easy-hugo-previewtime "300" t)
 '(easy-hugo-url "http://zzamboni.org/" t)
 '(gist-view-gist t t)
 '(global-visible-mark-mode t)
 '(helm-flx-for-helm-find-files t t)
 '(helm-flx-for-helm-locate t t)
 '(indent-tabs-mode nil)
 '(jiralib-url "https://jira.swisscom.com")
 '(js-indent-level 2)
 '(kill-whole-line t)
 '(load-prefer-newer t)
 '(lua-indent-level 2)
 '(mac-command-modifier (quote meta))
 '(mac-option-modifier (quote alt))
 '(mac-right-option-modifier (quote super))
 '(mouse-yank-at-point t)
 '(ns-alternate-modifier (quote alt))
 '(ns-command-modifier (quote meta))
 '(ns-right-alternate-modifier (quote super))
 '(org-agenda-files (quote ("~/tmp/20180522-oce-capability-review.org")))
 '(org-confirm-babel-evaluate nil)
 '(org-default-notes-file "~/Dropbox/org/notes.org")
 '(org-directory "~/Dropbox/org")
 '(org-entities-user
   (quote
    (("llangle" "\\llangle" t "&lang;&lang;" "<<" "<<" "《")
     ("rrangle" "\\rrangle" t "&rang;&rang;" ">>" ">>" "》"))))
 '(org-hide-emphasis-markers t)
 '(org-hugo-use-code-for-kbd t)
 '(org-journal-dir "~/Documents/logbook")
 '(org-latex-compiler "lualatex")
 '(org-latex-pdf-process
   (quote
    ("%latex -shell-escape -interaction nonstopmode -output-directory %o %f" "%latex -interaction nonstopmode -output-directory %o %f" "%latex -interaction nonstopmode -output-directory %o %f")))
 '(org-log-done t)
 '(org-mac-grab-Acrobat-app-p nil)
 '(org-mac-grab-devonthink-app-p nil)
 '(org-plantuml-jar-path "/usr/local/Cellar/plantuml/1.2017.18/libexec/plantuml.jar")
 '(org-reveal-note-key-char nil)
 '(org-reveal-root "file:///Users/taazadi1/Dropbox/org/reveal.js")
 '(org-src-fontify-natively t)
 '(org-src-tab-acts-natively t)
 '(org-startup-indented t)
 '(org-structure-template-alist
   (quote
    (("a" . "export ascii")
     ("c" . "center")
     ("C" . "comment")
     ("e" . "example")
     ("E" . "export")
     ("h" . "export html")
     ("l" . "export latex")
     ("q" . "quote")
     ("s" . "src")
     ("v" . "verse")
     ("n" . "note")
     ("d" . "description"))))
 '(org-use-speed-commands
   (lambda nil
     (and
      (looking-at org-outline-regexp)
      (looking-back "^**"))))
 '(package-archives
   (quote
    (("gnu" . "https://elpa.gnu.org/packages/")
     ("marmalade" . "https://marmalade-repo.org/packages/")
     ("melpa" . "https://melpa.org/packages/"))))
 '(package-selected-packages
   (quote
    (org-fstree esup package-build org-capture org-babel ox-texinfo gist helm-flx which-key spaceline pretty-mode visual-regexp-steroids ox-hugo adaptive-wrap yankpad smart-mode-line org-plus-contrib ob-cfengine3 org-journal ox-asciidoc org-jira ox-jira org-bullets ox-reveal lispy parinfer uniquify csv all-the-icons toc-org helm cider clojure-mode ido-completing-read+ writeroom-mode crosshairs ox-confluence ox-md inf-ruby ob-plantuml ob-ruby darktooth-theme kaolin-themes htmlize ag col-highlight nix-mode easy-hugo elvish-mode zen-mode racket-mode package-lint scala-mode go-mode wc-mode neotree applescript-mode ack magit clj-refactor yaml-mode visual-fill-column visible-mark use-package unfill typopunct smooth-scrolling smex smartparens rainbow-delimiters projectile markdown-mode magit-popup lua-mode keyfreq imenu-anywhere iedit ido-ubiquitous hl-sexp gruvbox-theme git-commit fish-mode exec-path-from-shell company clojure-mode-extra-font-locking clojure-cheatsheet aggressive-indent adoc-mode 4clojure)))
 '(read-buffer-completion-ignore-case t)
 '(read-file-name-completion-ignore-case t)
 '(reb-re-syntax (quote string))
 '(recentf-max-menu-items 100)
 '(recentf-max-saved-items 100)
 '(safe-local-variable-values
   (quote
    ((org-latex-image-default-width . "0.5\\textwidth")
     (eval progn
           (defun zz/org-macro-hsapi-code
               (link function desc)
             (let*
                 ((link-1
                   (concat link
                           (if
                               (org-string-nw-p function)
                               (concat "#" function)
                             "")))
                  (link-2
                   (concat link
                           (if
                               (org-string-nw-p function)
                               (concat "." function)
                             "")))
                  (desc-1
                   (or
                    (org-string-nw-p desc)
                    (concat "=" link-2 "="))))
               (concat "[[http://www.hammerspoon.org/docs/" link-1 "][" desc-1 "]]")))
           (defun zz/org-macro-keys-code-outer
               (str)
             (mapconcat
              (lambda
                (s)
                (concat "~" s "~"))
              (split-string str)
              (concat
               (string 8203)
               "+"
               (string 8203))))
           (defun zz/org-macro-keys-code-inner
               (str)
             (concat "~"
                     (mapconcat
                      (lambda
                        (s)
                        (concat s))
                      (split-string str)
                      (concat
                       (string 8203)
                       "-"
                       (string 8203)))
                     "~"))
           (defun zz/org-macro-keys-code
               (str)
             (zz/org-macro-keys-code-inner str))
           (defun zz/org-macro-luadoc-code
               (func section desc)
             (let*
                 ((anchor
                   (or
                    (org-string-nw-p section)
                    func))
                  (desc-1
                   (or
                    (org-string-nw-p desc)
                    func)))
               (concat "[[https://www.lua.org/manual/5.3/manual.html#" anchor "][" desc-1 "]]")))
           (defun zz/org-macro-luafun-code
               (func desc)
             (let*
                 ((anchor
                   (concat "pdf-" func))
                  (desc-1
                   (or
                    (org-string-nw-p desc)
                    (concat "=" func "()="))))
               (concat "[[https://www.lua.org/manual/5.3/manual.html#" anchor "][" desc-1 "]]"))))
     (eval add-hook
           (quote after-save-hook)
           (function org-hugo-export-wim-to-md-after-save)
           :append :local)
     (org-adapt-indentation)
     (org-edit-src-content-indentation . 2))))
 '(show-trailing-whitespace t)
 '(sml/replacer-regexp-list
   (quote
    (("^~/\\.emacs\\.d/elpa/" ":ELPA:")
     ("^~/\\.emacs\\.d/" ":ED:")
     ("^/sudo:.*:" ":SU:")
     ("^~/Documents/" ":Doc:")
     ("^:\\([^:]*\\):Documento?s/" ":\\1/Doc:")
     ("^~/Dropbox/" ":DB:")
     ("^:DB:org" ":Org:")
     ("^:DB:Personal/" ":P:")
     ("^:DB:Personal/writing/" ":Write:")
     ("^:P:devel/" ":Dev:")
     ("^:Write:learning-cfengine-3/learning-cfengine-3/" ":cf-learn:")
     ("^:Dev:go/src/github.com/elves/elvish/" ":elvish:")
     ("^:Dev:zzamboni.org/zzamboni.org/" ":zz.org:"))))
 '(sml/theme (quote dark))
 '(sp-base-key-bindings (quote paredit) t)
 '(tab-width 2)
 '(tool-bar-mode nil)
 '(uniquify-after-kill-buffer-p t)
 '(uniquify-buffer-name-style (quote post-forward) nil (uniquify))
 '(uniquify-strip-common-suffix t)
 '(use-package-always-defer t)
 '(use-package-always-ensure t)
 '(vr/engine (quote pcre2el) t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#282828" :foreground "#FDF4C1" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 160 :width normal :foundry "nil" :family "Inconsolata"))))
 '(col-highlight ((t (:background "#3c3836"))))
 '(fixed-pitch ((t (:family "Inconsolata"))))
 '(linum ((t (:background "#282828" :foreground "#504945" :height 140 :family "Inconsolata"))))
 '(markup-meta-face ((t (:foreground "gray40" :height 140 :family "Inconsolata"))))
 '(markup-title-0-face ((t (:inherit markup-gen-face :height 1.6))))
 '(markup-title-1-face ((t (:inherit markup-gen-face :height 1.5))))
 '(markup-title-2-face ((t (:inherit markup-gen-face :height 1.4))))
 '(markup-title-3-face ((t (:inherit markup-gen-face :weight bold :height 1.3))))
 '(markup-title-5-face ((t (:inherit markup-gen-face :underline t :height 1.1))))
 '(org-block ((t (:inherit fixed-pitch))))
 '(org-code ((t (:inherit (shadow fixed-pitch)))))
 '(org-document-info ((t (:foreground "dark orange"))))
 '(org-document-info-keyword ((t (:inherit (shadow fixed-pitch)))))
 '(org-document-title ((((class color) (min-colors 16777215)) (:foreground "#3FD7E5" :weight bold)) (((class color) (min-colors 255)) (:foreground "#00d7ff" :weight bold))))
 '(org-level-1 ((((class color) (min-colors 16777215)) (:foreground "#FE8019")) (((class color) (min-colors 255)) (:foreground "#ff8700"))))
 '(org-level-2 ((((class color) (min-colors 16777215)) (:foreground "#B8BB26")) (((class color) (min-colors 255)) (:foreground "#afaf00"))))
 '(org-level-3 ((((class color) (min-colors 16777215)) (:foreground "#83A598")) (((class color) (min-colors 255)) (:foreground "#87afaf"))))
 '(org-level-4 ((((class color) (min-colors 16777215)) (:foreground "#FABD2F")) (((class color) (min-colors 255)) (:foreground "#ffaf00"))))
 '(org-level-5 ((((class color) (min-colors 16777215)) (:foreground "#427B58")) (((class color) (min-colors 255)) (:foreground "#5f8787"))))
 '(org-level-6 ((((class color) (min-colors 16777215)) (:foreground "#B8BB26")) (((class color) (min-colors 255)) (:foreground "#afaf00"))))
 '(org-level-7 ((((class color) (min-colors 16777215)) (:foreground "#FB4933")) (((class color) (min-colors 255)) (:foreground "#d75f5f"))))
 '(org-level-8 ((((class color) (min-colors 16777215)) (:foreground "#83A598")) (((class color) (min-colors 255)) (:foreground "#87afaf"))))
 '(org-link ((t (:foreground "royal blue" :underline t))))
 '(org-meta-line ((t (:inherit (font-lock-comment-face fixed-pitch)))))
 '(org-property-value ((t (:inherit fixed-pitch))) t)
 '(org-special-keyword ((t (:inherit (font-lock-comment-face fixed-pitch)))))
 '(org-tag ((t (:inherit (shadow fixed-pitch) :weight bold :height 0.8))))
 '(org-verbatim ((t (:inherit (shadow fixed-pitch)))))
 '(variable-pitch ((t (:weight light :height 180 :family "Source Sans Pro")))))
