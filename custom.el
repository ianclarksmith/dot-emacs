(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(company-backends
   (quote
    (company-bbdb company-semantic company-clang company-cmake company-capf company-files
                  (company-dabbrev-code company-gtags company-keywords)
                  company-oddmuse company-dabbrev)))
 '(custom-safe-themes
   (quote
    ("a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" "c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "1436d643b98844555d56c59c74004eb158dc85fc55d2e7205f8d9b8c860e177f" default)))
 '(global-visible-mark-mode t)
 '(helm-completion-style (quote emacs))
 '(iedit-toggle-key-default [67108923])
 '(js-indent-level 2)
 '(lua-indent-level 2)
 '(org-export-with-broken-links t)
 '(org-show-context-detail
   (quote
    ((agenda . tree)
     (bookmark-jump . lineage)
     (isearch . lineage)
     (default . ancestors))))
 '(package-selected-packages
   (quote
    (ox-leanpub flycheck loop org-edna org-agenda-property org-gtd emacsql-sqlite emacsql emqcsql helm-pass org-download org-roam hide-mode-line spacemacs-theme spacemacs-light xr gcmh org-sticky-header lorem-ipsum ox-rst emr org-sidebar ns-auto-titlebar org-super-agenda swiss-holidays quelpa-use-package quelpa mexican-holidays holidays org-agenda undo-tree paradox restart-emacs dhall-mode ox-clip deft dockerfile-mode ox-gfm swiper-helm auth-sources plantuml-mode org-fstree esup package-build org-capture org-babel ox-texinfo gist helm-flx which-key spaceline pretty-mode visual-regexp-steroids ox-hugo adaptive-wrap yankpad smart-mode-line org-plus-contrib ob-cfengine3 org-journal ox-asciidoc org-jira ox-jira org-bullets ox-reveal lispy parinfer uniquify csv all-the-icons toc-org helm cider clojure-mode ido-completing-read+ writeroom-mode crosshairs ox-confluence ox-md inf-ruby ob-plantuml ob-ruby darktooth-theme kaolin-themes htmlize ag col-highlight nix-mode easy-hugo elvish-mode zen-mode racket-mode package-lint scala-mode go-mode wc-mode neotree applescript-mode ack magit clj-refactor yaml-mode visual-fill-column visible-mark use-package unfill typopunct smooth-scrolling smex smartparens rainbow-delimiters projectile markdown-mode magit-popup lua-mode keyfreq imenu-anywhere iedit ido-ubiquitous hl-sexp gruvbox-theme git-commit fish-mode exec-path-from-shell company clojure-mode-extra-font-locking clojure-cheatsheet aggressive-indent adoc-mode 4clojure)))
 '(reb-re-syntax (quote string))
 '(safe-local-variable-values
   (quote
    ((eval when
           (and
            (buffer-file-name)
            (not
             (file-directory-p
              (buffer-file-name)))
            (string-match-p "^[^.]"
                            (buffer-file-name)))
           (unless
               (featurep
                (quote package-build))
             (let
                 ((load-path
                   (cons "../package-build" load-path)))
               (require
                (quote package-build))))
           (unless
               (derived-mode-p
                (quote emacs-lisp-mode))
             (emacs-lisp-mode))
           (package-build-minor-mode)
           (setq-local flycheck-checkers nil)
           (set
            (make-local-variable
             (quote package-build-working-dir))
            (expand-file-name "../working/"))
           (set
            (make-local-variable
             (quote package-build-archive-dir))
            (expand-file-name "../packages/"))
           (set
            (make-local-variable
             (quote package-build-recipes-dir))
            default-directory))
     (eval add-hook
           (quote after-save-hook)
           (lambda nil
             (org-export-to-file
                 (quote awesomecv)
                 "zamboni-resume.tex"))
           :append :local)
     (eval add-hook
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
 '(tab-width 2)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#fbf8ef" :foreground "#655370" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 160 :width normal :foundry "nil" :family "Fira Code Retina"))))
 '(fixed-pitch ((t (:height 160 :family "Fira Code Retina"))))
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
 '(org-block ((t (:inherit fixed-pitch :foreground "#655370" :background "#fbf8ef"))))
 '(org-block-begin-line ((t (:inherit fixed-pitch :background "#ddd8eb" :foreground "#9380b2"))))
 '(org-block-end-line ((t (:inherit fixed-pitch :background "#ddd8eb" :foreground "#9380b2"))))
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
