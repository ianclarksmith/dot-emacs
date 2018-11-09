(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ad-redefinition-action (quote accept))
 '(auto-insert-directory "~/.emacs.d/auto-insert/" nil nil "Customized with use-package autoinsert")
 '(backup-directory-alist (quote (("." . "~/.emacs.d/backups"))))
 '(cider-repl-history-file "~/.emacs.d/cider-history" t nil "Customized with use-package cider")
 '(cider-repl-history-size 5000 t nil "Customized with use-package cider")
 '(cider-repl-pop-to-buffer-on-connect t t nil "Customized with use-package cider")
 '(cider-repl-result-prefix "; => " t nil "Customized with use-package cider")
 '(cider-repl-use-clojure-font-lock t t nil "Customized with use-package cider")
 '(cider-repl-use-pretty-printing nil t nil "Customized with use-package cider")
 '(cider-repl-wrap-history t t nil "Customized with use-package cider")
 '(cider-show-error-buffer nil t nil "Customized with use-package cider")
 '(column-number-mode t)
 '(custom-safe-themes
   (quote
    ("e08cf6a643018ccf990a099bcf82903d64f02e64798d13a1859e79e47c45616e" "7f89ec3c988c398b88f7304a75ed225eaac64efa8df3638c815acc563dfd3b55" "cd4d1a0656fee24dc062b997f54d6f9b7da8f6dc8053ac858f15820f9a04a679" "c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" "a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "6ac7c0f959f0d7853915012e78ff70150bfbe2a69a1b703c3ac4184f9ae3ae02" "8e4efc4bed89c4e67167fdabff77102abeb0b1c203953de1e6ab4d2e3a02939a" "a1a966cf2e87be6a148158c79863440ba2e45aa06cc214341feafe5c6deca4f2" "3eb2b5607b41ad8a6da75fe04d5f92a46d1b9a95a202e3f5369e2cdefb7aac5c" "3d0142352ce19c860047ad7402546944f84c270e84ae479beddbc2608268e0e5" "a33858123d3d3ca10c03c657693881b9f8810c9e242a62f1ad6380adf57b031c" "a40eac965142a2057269f8b2abd546b71a0e58e733c6668a62b1ad1aa7669220" "7be789f201ea16242dab84dd5f225a55370dbecae248d4251edbd286fe879cfa" "94dac4d15d12ba671f77a93d84ad9f799808714d4c5d247d5fd944df951b91d6" "4d8fab23f15347bce54eb7137789ab93007010fa47296c2f36757ff84b5b3c8a" default)))
 '(desktop-lazy-idle-delay 1 nil nil "Restore the rest of the buffers 1 seconds later")
 '(desktop-lazy-verbose nil nil nil "Be silent about lazily opening buffers")
 '(desktop-restore-eager 1 nil nil "Restore only the first buffer right away")
 '(easy-hugo-basedir "~/Personal/devel/zzamboni.org/zzamboni.org/" t nil "Customized with use-package easy-hugo")
 '(easy-hugo-previewtime "300" t nil "Customized with use-package easy-hugo")
 '(easy-hugo-url "http://zzamboni.org/" t nil "Customized with use-package easy-hugo")
 '(gist-view-gist t t nil "Automatically open new gists in browser")
 '(global-visible-mark-mode t)
 '(helm-flx-for-helm-find-files t t nil "Customized with use-package helm-flx")
 '(helm-flx-for-helm-locate t t nil "Customized with use-package helm-flx")
 '(indent-tabs-mode nil)
 '(jiralib-url "https://jira.swisscom.com" nil nil "Customized with use-package org-jira")
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
 '(org-confirm-babel-evaluate nil nil nil "Customized with use-package org")
 '(org-default-notes-file "~/Dropbox/org/notes.org" nil nil "Customized with use-package org")
 '(org-directory "~/Dropbox/org" nil nil "Customized with use-package org")
 '(org-entities-user
   (quote
    (("llangle" "\\llangle" t "&lang;&lang;" "<<" "<<" "《")
     ("rrangle" "\\rrangle" t "&rang;&rang;" ">>" ">>" "》"))))
 '(org-export-with-broken-links t)
 '(org-hide-emphasis-markers t nil nil "Customized with use-package org")
 '(org-hugo-use-code-for-kbd t)
 '(org-journal-dir "~/Documents/logbook" nil nil "Customized with use-package org-journal")
 '(org-latex-compiler "xelatex" nil nil "Customized with use-package ox-latex")
 '(org-latex-pdf-process
   (quote
    ("%latex -shell-escape -interaction nonstopmode -output-directory %o %f" "%latex -interaction nonstopmode -output-directory %o %f" "%latex -interaction nonstopmode -output-directory %o %f")) nil nil "Customized with use-package ox-latex")
 '(org-log-done t nil nil "Customized with use-package org")
 '(org-mac-grab-Acrobat-app-p nil)
 '(org-mac-grab-devonthink-app-p nil)
 '(org-plantuml-jar-path "/usr/local/Cellar/plantuml/1.2018.11/libexec/plantuml.jar" nil nil "Customized with use-package ob-plantuml")
 '(org-reveal-note-key-char nil nil nil "Customized with use-package ox-reveal")
 '(org-reveal-root "file:///Users/taazadi1/Dropbox/org/reveal.js" nil nil "Customized with use-package ox-reveal")
 '(org-src-fontify-natively t nil nil "Customized with use-package org")
 '(org-src-tab-acts-natively t nil nil "Customized with use-package org")
 '(org-startup-indented t nil nil "Customized with use-package org")
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
      (looking-back "^**"))) nil nil "Customized with use-package org")
 '(package-archives
   (quote
    (("marmalade" . "https://marmalade-repo.org/packages/")
     ("melpa" . "https://melpa.org/packages/"))))
 '(package-selected-packages
   (quote
    (auth-sources plantuml-mode org-fstree esup package-build org-capture org-babel ox-texinfo gist helm-flx which-key spaceline pretty-mode visual-regexp-steroids ox-hugo adaptive-wrap yankpad smart-mode-line org-plus-contrib ob-cfengine3 org-journal ox-asciidoc org-jira ox-jira org-bullets ox-reveal lispy parinfer uniquify csv all-the-icons toc-org helm cider clojure-mode ido-completing-read+ writeroom-mode crosshairs ox-confluence ox-md inf-ruby ob-plantuml ob-ruby darktooth-theme kaolin-themes htmlize ag col-highlight nix-mode easy-hugo elvish-mode zen-mode racket-mode package-lint scala-mode go-mode wc-mode neotree applescript-mode ack magit clj-refactor yaml-mode visual-fill-column visible-mark use-package unfill typopunct smooth-scrolling smex smartparens rainbow-delimiters projectile markdown-mode magit-popup lua-mode keyfreq imenu-anywhere iedit ido-ubiquitous hl-sexp gruvbox-theme git-commit fish-mode exec-path-from-shell company clojure-mode-extra-font-locking clojure-cheatsheet aggressive-indent adoc-mode 4clojure)))
 '(paradox-automatically-star t nil nil "Customized with use-package paradox")
 '(plantuml-jar-path "/usr/local/Cellar/plantuml/1.2018.11/libexec/plantuml.jar" t nil "Customized with use-package plantuml-mode")
 '(read-buffer-completion-ignore-case t)
 '(read-file-name-completion-ignore-case t)
 '(reb-re-syntax (quote string))
 '(recentf-max-menu-items 100 nil nil "Customized with use-package recentf")
 '(recentf-max-saved-items 100 nil nil "Customized with use-package recentf")
 '(safe-local-variable-values
   (quote
    ((org-hugo-auto-export-on-save . t)
     (org-latex-image-default-width . "0.5\\textwidth")
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
     ("^:Dev:zzamboni.org/zzamboni.org/" ":zz.org:"))) nil nil "Customized with use-package smart-mode-line")
 '(sml/theme (quote dark) nil nil "Customized with use-package smart-mode-line")
 '(sp-base-key-bindings (quote paredit) nil nil "Customized with use-package smartparens")
 '(tab-width 2)
 '(tool-bar-mode nil)
 '(uniquify-after-kill-buffer-p t nil nil "Customized with use-package uniquify")
 '(uniquify-buffer-name-style (quote post-forward) nil (uniquify) "Customized with use-package uniquify")
 '(uniquify-strip-common-suffix t nil nil "Customized with use-package uniquify")
 '(use-package-always-defer t)
 '(use-package-always-ensure t)
 '(vr/engine (quote pcre2el) nil nil "Use PCRE regular expressions"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#282828" :foreground "#FDF4C1" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 160 :width normal :foundry "nil" :family "Inconsolata"))))
 '(col-highlight ((t (:background "#3c3836"))))
 '(fixed-pitch ((t (:family "Inconsolata"))))
 '(font-latex-sedate-face ((t (:inherit fixed-pitch :foreground "#a89984"))))
 '(font-lock-comment-face ((t (:inherit fixed-pitch :foreground "#7c6f64"))))
 '(font-lock-function-name-face ((t (:inherit fixed-pitch :foreground "#fabd2f"))))
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
 '(org-table ((t (:inherit fixed-pitch :foreground "#83a598"))))
 '(org-tag ((t (:inherit (shadow fixed-pitch) :weight bold :height 0.8))))
 '(org-verbatim ((t (:inherit (shadow fixed-pitch)))))
 '(variable-pitch ((t (:weight light :height 180 :family "Source Sans Pro")))))
