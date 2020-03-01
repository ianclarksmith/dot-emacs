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
 '(company-backends
   (quote
    (company-bbdb company-eclim company-semantic company-clang company-xcode company-cmake company-capf company-files
                  (company-dabbrev-code company-gtags company-keywords)
                  company-oddmuse company-dabbrev)))
 '(custom-safe-themes
   (quote
    ("a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" "c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "1436d643b98844555d56c59c74004eb158dc85fc55d2e7205f8d9b8c860e177f" default)))
 '(deft-default-extension "org" t)
 '(deft-directory "~/Dropbox/Personal/org" t)
 '(deft-extensions (quote ("org" "txt" "text" "md" "markdown" "org.gpg")) t)
 '(deft-file-naming-rules
    (quote
     ((noslash . "-")
      (nospace . "-")
      (case-fn . downcase))) t)
 '(deft-org-mode-title-prefix t t)
 '(deft-recursive t t)
 '(deft-use-filename-as-title nil t)
 '(deft-use-filter-string-for-filename t t)
 '(desktop-lazy-idle-delay 1 nil nil "Restore the rest of the buffers 1 seconds later")
 '(desktop-lazy-verbose nil nil nil "Be silent about lazily opening buffers")
 '(desktop-restore-eager 1 nil nil "Restore only the first buffer right away")
 '(easy-hugo-basedir "~/Personal/devel/zzamboni.org/zzamboni.org/" t nil "Customized with use-package easy-hugo")
 '(easy-hugo-previewtime "300" t nil "Customized with use-package easy-hugo")
 '(easy-hugo-url "http://zzamboni.org/" t nil "Customized with use-package easy-hugo")
 '(epa-file-select-keys (quote silent) t)
 '(erc-autojoin-channels-alist
   (quote
    (("freenode.net" "#elvish" "#hammerspoon" "#org-mode"))) t)
 '(erc-autojoin-timing (quote ident) t)
 '(erc-fill-function (quote erc-fill-static) t)
 '(erc-fill-static-center 22 t)
 '(erc-hide-list (quote ("JOIN" "PART" "QUIT")) t)
 '(erc-lurker-hide-list (quote ("JOIN" "PART" "QUIT")) t)
 '(erc-lurker-threshold-time 43200 t)
 '(erc-nick "zzamboni" t)
 '(erc-prompt-for-nickserv-password nil t)
 '(erc-server-reconnect-attempts 5 t)
 '(erc-server-reconnect-timeout 3 t)
 '(erc-track-exclude-types
   (quote
    ("JOIN" "MODE" "NICK" "PART" "QUIT" "324" "329" "332" "333" "353" "477")) t)
 '(gcmh-verbose t)
 '(gist-view-gist t t nil "Automatically open new gists in browser")
 '(global-visible-mark-mode t)
 '(helm-completion-style (quote emacs))
 '(helm-flx-for-helm-find-files t t nil "Customized with use-package helm-flx")
 '(helm-flx-for-helm-locate t t nil "Customized with use-package helm-flx")
 '(iedit-toggle-key-default [67108923])
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
 '(neo-smart-open t t)
 '(neo-theme (quote icons) t)
 '(ns-alternate-modifier (quote alt))
 '(ns-command-modifier (quote meta))
 '(ns-right-alternate-modifier (quote super))
 '(org-agenda-files
   (quote
    ("~/Work/work.org.gpg" "~/org/ideas.org" "~/Personal/org/projects.org" "~/org/diary.org" "/Users/taazadi1/Dropbox/Personal/org/journal/2019/10/20191004.gpg")))
 '(org-agenda-include-diary t)
 '(org-agenda-prefix-format
   (quote
    ((agenda . " %i %-12:c%?-12t% s")
     (todo . " %i %-12:c%l")
     (tags . " %i %-12:c")
     (search . " %i %-12:c"))))
 '(org-agenda-start-on-weekday nil)
 '(org-archive-location "archive.org::datetree/")
 '(org-confirm-babel-evaluate nil nil nil "Customized with use-package org")
 '(org-crypt-key "diego@zzamboni.org" t)
 '(org-default-notes-file "~/Dropbox/org/notes.org" nil nil "Customized with use-package org")
 '(org-directory "~/Dropbox/Personal/org" nil nil "Customized with use-package org")
 '(org-download-method (quote attach))
 '(org-download-screenshot-method "screencapture -i %s")
 '(org-entities-user
   (quote
    (("llangle" "\\llangle" t "&lang;&lang;" "<<" "<<" "《")
     ("rrangle" "\\rrangle" t "&rang;&rang;" ">>" ">>" "》"))))
 '(org-export-with-broken-links t)
 '(org-fontify-done-headline t)
 '(org-hide-emphasis-markers t nil nil "Customized with use-package org")
 '(org-html-checkbox-type (quote unicode))
 '(org-hugo-use-code-for-kbd t)
 '(org-indent-indentation-per-level 4)
 '(org-journal-date-format "%A, %Y-%m-%d" t)
 '(org-journal-dir "~/Dropbox/Personal/org/journal" t)
 '(org-journal-enable-agenda-integration t t)
 '(org-journal-enable-encryption nil t)
 '(org-journal-encrypt-journal t t)
 '(org-journal-file-format "%Y/%m/%Y%m%d" t)
 '(org-latex-compiler "xelatex" nil nil "Customized with use-package ox-latex")
 '(org-latex-pdf-process
   (quote
    ("%latex -shell-escape -interaction nonstopmode -output-directory %o %f" "%latex -interaction nonstopmode -output-directory %o %f" "%latex -interaction nonstopmode -output-directory %o %f")) nil nil "Customized with use-package ox-latex")
 '(org-log-done t nil nil "Customized with use-package org")
 '(org-log-into-drawer t)
 '(org-mac-grab-Acrobat-app-p nil)
 '(org-mac-grab-devonthink-app-p nil)
 '(org-plantuml-jar-path
   "/usr/local/Cellar/plantuml/1.2020.1_1/libexec/plantuml.jar" nil nil "Customized with use-package ob-plantuml")
 '(org-reveal-note-key-char nil nil nil "Customized with use-package ox-reveal")
 '(org-reveal-root "file:///Users/taazadi1/.emacs.d/lisp/reveal.js" nil nil "Customized with use-package ox-reveal")
 '(org-roam-directory "~/Dropbox/Personal/org" t)
 '(org-show-context-detail
   (quote
    ((agenda . tree)
     (bookmark-jump . lineage)
     (isearch . lineage)
     (default . ancestors))))
 '(org-special-ctrl-a/e t)
 '(org-special-ctrl-k t)
 '(org-src-fontify-natively t nil nil "Customized with use-package org")
 '(org-src-tab-acts-natively t nil nil "Customized with use-package org")
 '(org-startup-indented t nil nil "Customized with use-package org")
 '(org-super-agenda-groups (quote ((:auto-dir-name t))))
 '(org-tags-column 0)
 '(org-todo-keyword-faces
   (quote
    (("AREA" . "DarkOrchid1")
     ("[AREA]" . "DarkOrchid1")
     ("PROJECT" . "DarkOrchid1")
     ("[PROJECT]" . "DarkOrchid1")
     ("INBOX" . "cyan")
     ("[INBOX]" . "cyan")
     ("PROPOSAL" . "orange")
     ("[PROPOSAL]" . "orange")
     ("DRAFT" . "yellow3")
     ("[DRAFT]" . "yellow3")
     ("INPROGRESS" . "yellow4")
     ("[INPROGRESS]" . "yellow4")
     ("MEETING" . "purple")
     ("[MEETING]" . "purple")
     ("CANCELED" . "blue")
     ("[CANCELED]" . "blue"))) nil nil "Customized with use-package org")
 '(org-use-speed-commands
   (lambda nil
     (and
      (looking-at org-outline-regexp)
      (looking-back "^**"))) nil nil "Customized with use-package org")
 '(package-archives
   (quote
    (("marmalade" . "https://marmalade-repo.org/packages/")
     ("melpa" . "https://melpa.org/packages/")
     ("elpa" . "https://elpa.gnu.org/packages/"))))
 '(package-selected-packages
   (quote
    (emacsql-sqlite emacsql emqcsql helm-pass org-download org-roam hide-mode-line spacemacs-theme spacemacs-light xr gcmh org-sticky-header lorem-ipsum ox-rst emr org-sidebar ns-auto-titlebar org-super-agenda swiss-holidays quelpa-use-package quelpa mexican-holidays holidays org-agenda undo-tree paradox restart-emacs dhall-mode ox-clip deft dockerfile-mode ox-gfm swiper-helm auth-sources plantuml-mode org-fstree esup package-build org-capture org-babel ox-texinfo gist helm-flx which-key spaceline pretty-mode visual-regexp-steroids ox-hugo adaptive-wrap yankpad smart-mode-line org-plus-contrib ob-cfengine3 org-journal ox-asciidoc org-jira ox-jira org-bullets ox-reveal lispy parinfer uniquify csv all-the-icons toc-org helm cider clojure-mode ido-completing-read+ writeroom-mode crosshairs ox-confluence ox-md inf-ruby ob-plantuml ob-ruby darktooth-theme kaolin-themes htmlize ag col-highlight nix-mode easy-hugo elvish-mode zen-mode racket-mode package-lint scala-mode go-mode wc-mode neotree applescript-mode ack magit clj-refactor yaml-mode visual-fill-column visible-mark use-package unfill typopunct smooth-scrolling smex smartparens rainbow-delimiters projectile markdown-mode magit-popup lua-mode keyfreq imenu-anywhere iedit ido-ubiquitous hl-sexp gruvbox-theme git-commit fish-mode exec-path-from-shell company clojure-mode-extra-font-locking clojure-cheatsheet aggressive-indent adoc-mode 4clojure)))
 '(paradox-github-token t)
 '(plantuml-jar-path
   "/usr/local/Cellar/plantuml/1.2020.1_1/libexec/plantuml.jar" t nil "Customized with use-package plantuml-mode")
 '(projectile-switch-project-action (quote neotree-projectile-action))
 '(read-buffer-completion-ignore-case t)
 '(read-file-name-completion-ignore-case t)
 '(reb-re-syntax (quote string))
 '(recentf-max-menu-items 100 nil nil "Customized with use-package recentf")
 '(recentf-max-saved-items 100 nil nil "Customized with use-package recentf")
 '(safe-local-variable-values
   (quote
    ((eval add-hook
           (quote after-save-hook)
           (function org-hugo-export-wim-to-md-after-save)
           :append :local)
     (eval add-hook
           (quote after-save-hook)
           (lambda nil
             (org-export-to-file
                 (quote awesomecv)
                 "zamboni-vita.tex"))
           :append :local)
     (org-babel-exp-code-template . "#+caption: %noweb-ref
#+BEGIN_SRC %lang%switches%flags
%body
#+END_SRC"))))
 '(show-trailing-whitespace nil)
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
 '(sml/theme (quote respectful) nil nil "Customized with use-package smart-mode-line")
 '(sp-base-key-bindings (quote paredit) nil nil "Customized with use-package smartparens")
 '(tab-width 2)
 '(tool-bar-mode nil)
 '(uniquify-after-kill-buffer-p t nil nil "Customized with use-package uniquify")
 '(uniquify-buffer-name-style (quote post-forward) nil (uniquify) "Customized with use-package uniquify")
 '(uniquify-strip-common-suffix t nil nil "Customized with use-package uniquify")
 '(use-package-always-defer t)
 '(use-package-always-ensure t)
 '(use-package-verbose nil)
 '(vr/engine (quote pcre2el) t nil "Use PCRE regular expressions"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#fbf8ef" :foreground "#655370" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 160 :width normal :foundry "nil" :family "Inconsolata Nerd Font"))))
 '(fixed-pitch ((t (:family "Inconsolata"))))
 '(font-latex-sedate-face ((t (:inherit fixed-pitch))))
 '(font-lock-comment-face ((t (:inherit fixed-pitch))))
 '(font-lock-function-name-face ((t (:inherit fixed-pitch))))
 '(header-line ((t (:background "#fbf8ef"))))
 '(markup-meta-face ((t (:height 140 :family "Inconsolata"))))
 '(markup-title-0-face ((t (:inherit markup-gen-face :height 1.6))))
 '(markup-title-1-face ((t (:inherit markup-gen-face :height 1.5))))
 '(markup-title-2-face ((t (:inherit markup-gen-face :height 1.4))))
 '(markup-title-3-face ((t (:inherit markup-gen-face :weight bold :height 1.3))))
 '(markup-title-5-face ((t (:inherit markup-gen-face :underline t :height 1.1))))
 '(org-block ((t (:inherit fixed-pitch))))
 '(org-code ((t (:inherit (shadow fixed-pitch)))))
 '(org-document-info ((t)))
 '(org-document-info-keyword ((t (:inherit (shadow fixed-pitch)))))
 '(org-document-title ((((class color) (min-colors 16777215)) (:weight bold)) (((class color) (min-colors 255)) (:weight bold))))
 '(org-done ((t (:strike-through t))))
 '(org-headline-done ((t (:inherit default :weight bold :font "Source Sans Pro" :strike-through t))))
 '(org-indent ((t (:inherit (org-hide fixed-pitch)))))
 '(org-level-1 ((((class color) (min-colors 16777215))) (((class color) (min-colors 255)))))
 '(org-level-2 ((((class color) (min-colors 16777215))) (((class color) (min-colors 255)))))
 '(org-level-3 ((((class color) (min-colors 16777215))) (((class color) (min-colors 255)))))
 '(org-level-4 ((((class color) (min-colors 16777215))) (((class color) (min-colors 255)))))
 '(org-level-5 ((((class color) (min-colors 16777215))) (((class color) (min-colors 255)))))
 '(org-level-6 ((((class color) (min-colors 16777215))) (((class color) (min-colors 255)))))
 '(org-level-7 ((((class color) (min-colors 16777215))) (((class color) (min-colors 255)))))
 '(org-level-8 ((((class color) (min-colors 16777215))) (((class color) (min-colors 255)))))
 '(org-link ((t (:underline t))))
 '(org-meta-line ((t (:inherit (font-lock-comment-face fixed-pitch)))))
 '(org-property-value ((t (:inherit fixed-pitch))) t)
 '(org-scheduled-previously ((t (:weight bold :underline nil))))
 '(org-special-keyword ((t (:inherit (font-lock-comment-face fixed-pitch)))))
 '(org-table ((t (:inherit fixed-pitch))))
 '(org-tag ((t (:inherit (shadow fixed-pitch) :weight bold :height 0.8))))
 '(org-verbatim ((t (:inherit (shadow fixed-pitch)))))
 '(variable-pitch ((t (:weight thin :height 200 :family "ETBembo")))))
