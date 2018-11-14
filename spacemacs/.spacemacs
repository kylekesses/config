
;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     auto-completion
     (c-c++ :variables c-c++-enable-clang-support t)
     clojure
     cscope
     csharp
     csv
     dash
     docker
     emacs-lisp
     git
     github
     gnus
     helm
     html
     imenu-list
     javascript
     markdown
     octave
     (org :variables org-enable-github-support t)
     pdf
     php
     python
     react
     restclient
     semantic
     shell
     shell-script
     spell-checking
     syntax-checking
     typescript
     w3m ; https://github.com/venmos/w3m-layer
     yaml
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(company-flow dtrt-indent rjsx-mode qml-mode ox-gfm yasnippet-snippets bbdb prettier-js indium arch-packer)
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services  
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set thiss
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(spacemacs-dark
                         spacemacs-light)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 13
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   dotspacemacs-line-numbers nil
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."

  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."
  ; https://github.com/syl20bnr/spacemacs/pull/10196
  (with-eval-after-load 'helm
    (setq helm-display-function 'helm-default-display-buffer))
  (autoload 'qml-mode "qml-mode" "Editing Qt Declarative." t)
  (add-to-list 'auto-mode-alist '("\\.qml$" . qml-mode))

  ; (spacemacs/add-flycheck-hook 'rjsx-mode)

  (require 'dtrt-indent)
  (spacemacs/set-leader-keys "ww" 'ace-window)
  (spacemacs/set-leader-keys "wW" 'other-window)
  (spacemacs/set-leader-keys "wm" 'maximize-window)

  ;; overriding some SPC w commands
  (spacemacs/set-leader-keys "w|" 'evil-window-set-width)
  (spacemacs/set-leader-keys "w_" 'evil-window-set-height)

  ;; buffers
  (spacemacs/set-leader-keys "bw" 'spacemacs/goto-buffer-workspace)
  (spacemacs/set-leader-keys "bW" 'read-only-mode)

  ;; ehsell
  (spacemacs/set-leader-keys-for-major-mode 'eshell-mode "h" 'helm-eshell-history)

  ;; dired
  ;(spacemacs/set-leader-keys "ad" 'projectile-dired)
  ;(spacemacs/set-leader-keys "aD" 'helm-projectile-find-dir)

  ;; Apps
  (spacemacs/set-leader-keys "ak" 'helm-show-kill-ring)
  (spacemacs/set-leader-keys "aK" 'paradox-list-packages)
  (spacemacs/set-leader-keys "ap" 'proced)
  (spacemacs/set-leader-keys "aP" 'list-processes)

  ;; helm imenu
  (spacemacs/set-leader-keys "so" 'helm-imenu)
  (message "hello")

  ;; org artist mode
  (add-hook 'artist-mode-hook
            (lambda ()
              (local-set-key (kbd "<f1>") 'org-mode)
              (local-set-key (kbd "<f2>") 'artist-select-op-pen-line) ; f2 = pen mode
              (local-set-key (kbd "<f3>") 'artist-select-op-line)     ; f3 = line
              (local-set-key (kbd "<f4>") 'artist-select-op-rectangle)   ; f4 = rectangle
              (local-set-key (kbd "<f5>") 'artist-select-op-ellipse)  ; f5 = ellipse
              (local-set-key (kbd "C-z") 'undo)))

  ;; add github support: https://github.com/syl20bnr/spacemacs/tree/master/layers/%2Bemacs/org#github-support

  (with-eval-after-load 'org
    (require 'ox-md nil t)
    (require 'ox-bibtex)
    ;; https://emacs.stackexchange.com/questions/29854/org-mode-and-bibtex-latex-export-problem
    (setq org-latex-pdf-process
          '("pdflatex -interaction nonstopmode -output-directory %o %f"
            "bibtex %b"
            "pdflatex -interaction nonstopmode -output-directory %o %f"
            "pdflatex -interaction nonstopmode -output-directory %o %f"))
    (require 'ob-python)
    (require 'ob-lisp)
    (require 'ob-calc)
    (require 'ob-ditaa)
    (require 'ox-gfm nil t)
    (org-babel-do-load-languages
     'org-babel-load-languages
     '(
       (C . t)
       (ruby . t)
       (lilypond . t)
       (emacs-lisp . t)
       (python .t)
       (ditaa .t)
       (plantuml . t)
       (gnuplot . t)
       (latex . t)
       (js . t)
       (haskell . t)
       (calc . t)
       )
     )
    )


  (defun export-princexml ()
    "export to html and post process with princexml"
    (interactive)
    (org-html-export-to-html)
    (shell-command (format "prince %s" (concat (substring (shell-quote-argument buffer-file-name) 0 -3) "html")))
    (shell-command (format (format "pdftk %s.pdf cat 2-end output %s-out.pdf && mv %s-out.pdf %s.pdf"
                                   (substring (shell-quote-argument buffer-file-name) 0 -4)
                                   (substring (shell-quote-argument buffer-file-name) 0 -4)
                                   (substring (shell-quote-argument buffer-file-name) 0 -4)
                                   (substring (shell-quote-argument buffer-file-name) 0 -4))))
    (shell-command (format (format "pdftk %s.pdf cat 2-end output %s-out.pdf && mv %s-out.pdf %s.pdf"
                                   (substring (shell-quote-argument buffer-file-name) 0 -4)
                                   (substring (shell-quote-argument buffer-file-name) 0 -4)
                                   (substring (shell-quote-argument buffer-file-name) 0 -4)
                                   (substring (shell-quote-argument buffer-file-name) 0 -4))))
    (shell-command (format "mv %s ./exports" (concat (substring (shell-quote-argument buffer-file-name) 0 -3) "pdf")))
    (shell-command "rm ./*.html"))

  (spacemacs/set-leader-keys-for-major-mode 'org-mode "eh" 'export-princexml)
  ;(load-file "~/config/spacemacs/flow/flow.el")
  ;(init-flowjs)

  (load-file "~/config/spacemacs/spark-shell/main.el")
  (setq spark-shell//bin-location"./kaggle/spark/bin/spark-shell")
  (setq spark-shell//username "binetruy")
  (setq spark-shell//hostname "c133-07")
  (spacemacs/set-leader-keys-for-major-mode 'scala-mode "ks" 'spark-shell//spawn)
  (spacemacs/set-leader-keys-for-major-mode 'scala-mode "kb" 'spark-shell//send-buffer)


  (defun nova/org-pdf-view ()
    "export to html and post process with princexml"
    (interactive)
    (let ((buffer
           (concat
            (substring
             buffer-file-name 0 -3)
            "pdf")))
          (split-window-right-and-focus)
          (find-file buffer)))

  (defun nova/org-save-and-export ()
    (interactive)
    (if (bound-and-true-p nova-mode)
        (export-princexml)
      (message "nova-mode is off")))

  (defun nova/nova-mode-init ()
    (interactive)
    (if (bound-and-true-p nova-mode)
        (progn
          (nova/org-pdf-view)
          (add-hook 'after-save-hook 'nova/org-save-and-export))
      (message "nova-mode is off")))

;;;###autoload
  (define-minor-mode nova-mode
    "Get your foos in the right places.")

;;;###autoload
  ; (add-hook 'org-mode-hook 'nova-mode)

  (provide 'nova-mode)

  (add-hook 'nova-mode-hook 'nova/nova-mode-init)



  (defun kdm/org-save-and-export ()
    (interactive)
    (if (eq major-mode 'org-mode)
        (export-princexml)))

  ; (add-hook 'after-save-hook 'kdm/org-save-and-export)


  (add-to-list 'load-path "~/.emacs.d/lisp/")
  (autoload 'gmail2bbdb-import-file "gmail2bbdb" nil t nil)

  ;; multiple cursors
  (global-set-key (kbd "C->") 'mc/mark-next-like-this)
  (global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
  (global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

  ;; prettier
  (require 'prettier-js)
  (add-hook 'js2-mode-hook 'prettier-js-mode)
  (add-hook 'rjsx-mode-hook 'prettier-js-mode)
  (add-hook 'typescript-mode-hook 'prettier-js-mode)
  (add-hook 'typescript-tsx-mode-hook 'prettier-js-mode)

  (setq prettier-js-args '(
                           "--trailing-comma" "all"
                           "--bracket-spacing" "false"
                           "--jsx-bracket-same-line"
                           ))

  (add-hook 'typescript-tsx-mode-hook (lambda ()
                                        (setq-local web-mode-code-indent-offset 2)
                                        (setq-local web-mode-markup-indent-offset 2)))

  ;; arch-packer
  (setq arch-packer-default-command "pacaur")

  (spacemacs/set-leader-keys "aas" 'arch-packer-search-package)
  (spacemacs/set-leader-keys "aai" 'arch-packer-install-package)
  (spacemacs/set-leader-keys "aal" 'arch-packer-list-packages)
  (spacemacs/set-leader-keys "aam" 'arch-packer-package-menu-mode)
  (spacemacs/set-leader-keys "aaS" 'arch-packer-search-mode)
)

(load-library "find-lisp")
;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(evil-want-Y-yank-to-eol nil)
 '(org-agenda-files
   (mapcar
    (quote abbreviate-file-name)
    (split-string
     (shell-command-to-string "find ~/code/nova-props ~/code/nova-admin ~/code/nova-website -name '*.org'")
     "
")))
 '(package-selected-packages
   (quote
    (restclient-helm ob-restclient ob-http company-restclient restclient know-your-http-well helm-w3m w3m yasnippet-snippets csv-mode ox-twbs ox-gfm org-mime ghub let-alist qml-mode disaster company-c-headers cmake-mode clang-format zeal-at-point helm-dash rjsx-mode pdf-tools tablist flyspell-correct-helm flyspell-correct auto-dictionary stickyfunc-enhance srefactor dtrt-indent helm-company helm-c-yasnippet fuzzy flycheck-pos-tip pos-tip flycheck company-web web-completion-data company-tern company-statistics company-flow company-anaconda company auto-yasnippet ac-ispell auto-complete tern web-beautify livid-mode skewer-mode simple-httpd json-mode json-snatcher json-reformat js2-refactor yasnippet multiple-cursors js2-mode js-doc coffee-mode xterm-color shell-pop multi-term eshell-z eshell-prompt-extras esh-help web-mode tagedit slim-mode scss-mode sass-mode pug-mode less-css-mode helm-css-scss haml-mode emmet-mode yaml-mode yapfify pyvenv pytest pyenv-mode py-isort pip-requirements live-py-mode hy-mode dash-functional helm-pydoc cython-mode anaconda-mode pythonic mmm-mode markdown-toc markdown-mode gh-md smeargle orgit org-projectile org-category-capture org-present org-pomodoro alert log4e gntp org-download magit-gitflow htmlize helm-gitignore gnuplot gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link evil-magit magit magit-popup git-commit with-editor ws-butler winum which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline powerline restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox spinner org-plus-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint info+ indent-guide hydra hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation hide-comnt help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make projectile pkg-info epl helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg undo-tree eval-sexp-fu highlight elisp-slime-nav dumb-jump f dash s diminish define-word column-enforce-mode clean-aindent-mode bind-map bind-key auto-highlight-symbol auto-compile packed aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line helm avy helm-core popup async))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(setq org-agenda-use-tag-inheritance nil)
(setq org-startup-folded nil)
(setq org-agenda-inhibit-startup nil)
(setq org-agenda-dim-blocked-tasks nil)
(setq org-agenda-ignore-drawer-properties '(esfort appt category))

;; org-todo types
(setq org-todo-keywords '((type "ME" "TB" "JM" "KK" "JB" "BS" "ALL" "|" "DONE")))

;; remove js2 mode semi column warning
(setq js2-strict-missing-semi-warning nil)


(put 'helm-make-build-dir 'safe-local-variable 'stringp)

;; don't ask for elisp code exectution
;; should test for nova-mode
(defun my-org-confirm-babel-evaluate (lang body)
  (and (not (string= lang "python")) (not (string= lang "emacs-lisp"))))  ; don't ask for elisp or python
(setq org-confirm-babel-evaluate 'my-org-confirm-babel-evaluate)

;; recalculate org buffer tables on nova-mode
(defun nova/recalc-buffer-tables ()
  (interactive)
  (if (bound-and-true-p nova-mode)
      (org-table-recalculate-buffer-tables)
    (message "nova-mode is off")))

(add-hook 'before-save-hook 'nova/recalc-buffer-tables)
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(evil-want-Y-yank-to-eol nil)
 '(org-agenda-files
   (mapcar
    (quote abbreviate-file-name)
    (split-string
     (shell-command-to-string "find ~/code/nova-props ~/code/nova-admin ~/code/nova-website -name '*.org'")
     "
")))
 '(package-selected-packages
   (quote
    (magithub ghub+ apiwrap magit-gh-pulls github-search github-clone git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-gutter gist gh marshal logito pcache ht diff-hl browse-at-remote restclient-helm ob-restclient ob-http company-restclient restclient know-your-http-well helm-w3m w3m yasnippet-snippets csv-mode ox-twbs ox-gfm org-mime ghub let-alist qml-mode disaster company-c-headers cmake-mode clang-format zeal-at-point helm-dash rjsx-mode pdf-tools tablist flyspell-correct-helm flyspell-correct auto-dictionary stickyfunc-enhance srefactor dtrt-indent helm-company helm-c-yasnippet fuzzy flycheck-pos-tip pos-tip flycheck company-web web-completion-data company-tern company-statistics company-flow company-anaconda company auto-yasnippet ac-ispell auto-complete tern web-beautify livid-mode skewer-mode simple-httpd json-mode json-snatcher json-reformat js2-refactor yasnippet multiple-cursors js2-mode js-doc coffee-mode xterm-color shell-pop multi-term eshell-z eshell-prompt-extras esh-help web-mode tagedit slim-mode scss-mode sass-mode pug-mode less-css-mode helm-css-scss haml-mode emmet-mode yaml-mode yapfify pyvenv pytest pyenv-mode py-isort pip-requirements live-py-mode hy-mode dash-functional helm-pydoc cython-mode anaconda-mode pythonic mmm-mode markdown-toc markdown-mode gh-md smeargle orgit org-projectile org-category-capture org-present org-pomodoro alert log4e gntp org-download magit-gitflow htmlize helm-gitignore gnuplot gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link evil-magit magit magit-popup git-commit with-editor ws-butler winum which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline powerline restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox spinner org-plus-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint info+ indent-guide hydra hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation hide-comnt help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make projectile pkg-info epl helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg undo-tree eval-sexp-fu highlight elisp-slime-nav dumb-jump f dash s diminish define-word column-enforce-mode clean-aindent-mode bind-map bind-key auto-highlight-symbol auto-compile packed aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line helm avy helm-core popup async))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
)




;; Get email, and store in nnml
(setq gnus-secondary-select-methods
      '(
        (nnimap "gmail"
                (nnimap-address
                 "imap.gmail.com")
                (nnimap-server-port 993)
                (nnimap-stream ssl))
        ))

;; Send email via Gmail:
(setq message-send-mail-function 'smtpmail-send-it
      smtpmail-default-smtp-server "smtp.gmail.com"
      smtpmail-stream-type  'ssl
      smtpmail-smtp-service 465)

;; Archive outgoing email in Sent folder on imap.gmail.com:
(setq gnus-message-archive-method '(nnimap "imap.gmail.com")
      gnus-message-archive-group "[Gmail]/Sent Mail")

;; set return email address based on incoming email address
(setq gnus-posting-styles
      '(((header "to" "address@outlook.com")
         (address "address@outlook.com"))
        ((header "to" "address@gmail.com")
         (address "address@gmail.com"))))

;; store email in ~/gmail directory
(setq nnml-directory "~/gmail")
(setq message-directory "~/gmail")

(setq user-mail-address "thomas@novamedia.nyc")
(setq user-full-name "Thomas Binetruy")


;; Reload org file list

(defun reload-agenda-file-list ()
  (interactive)
  (custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
  '(org-agenda-files
    (mapcar
     (quote abbreviate-file-name)
     (split-string
      (shell-command-to-string "find ~/code/nova-props ~/code/nova-admin -name '*.org' -not -name '.#*.org'")
      "
")))))
