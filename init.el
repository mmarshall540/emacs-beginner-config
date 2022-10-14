;;; init.el --- an Emacs configuration for beginners -*- lexical-binding: t; -*-

;; Copyright (C) 2022  Martin Marshall

;; Author: Martin Marshall <law@martinmarshall.com>
;; Keywords: convenience

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:

;; This is intended as a minimal configuration for Emacs beginners.
;; The idea is that because it is small, it can easily be built on and
;; learned from.  Yet it should provide a more pleasing out-of-the-box
;; experience than starting with no configuration.  Suggestions follow.
;;
;; This configuration opens this file and any other Emacs Lisp file
;; with `outline-minor-mode' enabled.  This makes it possible to view
;; the headings as a list and more easily browse their contents.  To
;; collapse all headings into a list, enter "C-c @ C-o" To open a
;; heading and view its contents, click the arrow to the right of the
;; heading, or place the cursor on the heading and then enter "C-c @
;; C-s".
;;
;; A minimal set of third-party packages will be installed on
;; first-run.  They are:
;; 
;; * ef-themes - a set of attractive and well thought-out themes
;; 
;; * marginalia - useful annotations added to *Completions* lists
;; 
;; * minimap - a miniature sidebar map (open with <f9>)
;; 
;; * rainbow-delimiters - matching-color parentheses, brackets, etc
;; 
;; * sr-speedbar - a file/buffer/info browsing sidebar (open with
;;   <f8>) that allows the built-in Speedbar to act as a sidebar
;;   window, rather than a separate frame
;; 
;; * which-key - automatically view bindings under prefixes like C-x,
;;   C-c, C-h, M-s, and M-g (or see top-level bindings with "C-h t")
;;   
;; * yasnippet + yasnippet-snippets - snippets, and lots of them, to
;;   ease entry of common text structures.
;;
;; There are other intended-to-be-helpful preconfigured settings, such
;; as:
;;
;; * Indentation highlighting in Python files using the built-in
;; `whitespace-mode'
;;
;; * Linefeeds (aka pagebreaks) displayed as horizontal lines, rather
;;   than the unslightly "^L" character
;;
;; * Enhanced built-in commands which don't come enabled by default
;;   are enabled here, such as `cycle-spacing' instead of
;;   `just-one-space' ("M-SPC"), and `ibuffer' instead of
;;   `list-buffers' ("C-x C-b")
;;
;; * The built-in completions system has been configured with
;;   sensible™ defaults.
;;   
;; You can access the *Completions* buffer by pressing "TAB" or
;; "C-n" in the minibuffer.  This may be slow if you do it without
;; narrowing the number of potential completions first.  For example
;; when you use "C-h v" to get the description of a variable, if you
;; press "TAB" without entering any text, Emacs will have to compile
;; a list of all variables it knows, which could take a few seconds.
;; If that proves to be an annoyance, feel free to "package-install
;; RET vertico RET".
;;
;; The Vertico, Consult, Embark, Marginalia, Lin, and Corfu packages
;; work well together and are recommended for installation.
;;
;; Diff-hl is also recommended for use with version-control, whether
;; the built-in `vc-mode' or the external Magit package.
;;
;; The Eglot package is also recommended, but it must be used with a
;; any of several "language server" programs that correspond to the
;; programming language you are writing in.  The language server
;; runs on your computer, but you must install it separately, using
;; your operating system's package manager.
;;
;; The idea is to provide just enough to get started.  Any of these
;; packages can be removed using the `package-delete' command.  In
;; addition, several configurations are provided for other external
;; packages (like vertico).  More packages can be found using the
;; `list-packages' command, which is also accessible from the menu
;; above.

;;; Code:


;;; !Default custom-settings

;; Designate the file to which Easy Customization (e.g. "M-x
;; customize-variable RET menu-bar-mode RET") will save settings.
(customize-set-variable 'custom-file
 (expand-file-name "my-custom.el" user-emacs-directory))

;; If `custom-file' already exists, go ahead and load it.  If not,
;; set some initial customizations and save them there.
(if (file-exists-p custom-file)
    (load custom-file)
  (progn
    ;; Editing the settings in this block will have no effect after
    ;; the first run, when they are copied to "my-custom.el".  If you
    ;; want to change any of them, use "M-x customize-variable RET
    ;; [variable-name] RET"
    (custom-set-variables
     '(after-init-hook
       '( auto-insert-mode delete-selection-mode electric-pair-mode
	  global-auto-revert-mode recentf-mode repeat-mode save-place-mode
	  turn-on-auto-fill winner-mode )
       t)
     '(after-save-hook '(executable-make-buffer-file-executable-if-script-p))
     '(align-to-tab-stop nil)
     '(auto-insert-query nil)
     '(blink-cursor-blinks 1)
     '(column-number-mode t)
     '(completion-auto-help 'visible)
     '(completion-auto-select nil)
     '(completion-show-help nil)
     '(completions-detailed t)
     '(completions-format 'one-column)
     '(completions-header-format nil)
     '(completions-max-height 15)
     '(custom-safe-themes t)
     '(delete-by-moving-to-trash t)
     '(delete-old-versions t)
     '(delete-pair-blink-delay 0.1)
     '(describe-bindings-outline t)
     '(dired-dwim-target t)
     '(display-time-mode t)
     '(display-time-use-mail-icon t)
     '(electric-pair-inhibit-predicate 'ignore)
     '(electric-pair-skip-self t)
     '(emacs-lisp-mode-hook '(my-add-imenu-package-headings outline-minor-mode))
     '(global-hl-line-sticky-flag nil)
     '(hl-line-sticky-flag nil)
     '(isearch-allow-motion t)
     '(isearch-allow-scroll t)
     '(isearch-lazy-count t)
     '(kept-new-versions 10)
     '(kept-old-versions 10)
     '(kill-whole-line t)
     '(minibuffer-mode-hook '(savehist-mode) t)
     '(org-mode-hook '(which-function-mode visual-line-mode) t)
     '(outline-minor-mode-use-margins t)
     '(package-archive-priorities '(("gnu" . 2) ("nongnu" . 1)))
     '(package-archives
       '(("gnu"	   . "https://elpa.gnu.org/packages/")
	 ("nongnu" . "https://elpa.nongnu.org/nongnu/")
	 ("melpa"  . "https://melpa.org/packages/")))
     '(package-native-compile t)
     '(package-selected-packages
       '( dumb-jump ef-themes marginalia minimap rainbow-delimiters sr-speedbar
	  which-key yasnippet yasnippet-snippets ))
     '(parens-require-spaces nil)
     '(pixel-scroll-mode t)
     '(pixel-scroll-precision-mode t)
     '(prog-mode-hook
       '( eldoc-mode flymake-mode hl-line-mode show-paren-mode
	  which-function-mode ))
     '(python-mode-hook '(my-python-indent-highlighting subword-mode) t)
     '(scalable-fonts-allowed t)
     '(set-mark-command-repeat-pop t)
     '(text-mode-hook '(hl-line-mode))
     '(warning-minimum-level :error))
    (custom-save-all)))


;;; !Helpers

;; The `my-set-unless' function allows setting a variable's value,
;; unless it was already set through the customize interface
;; (before the `my-customized-variables' list was defined).
(defvar my-customized-variables
  (mapcar
   (lambda (x) (when (eq (car x) 'theme-value) (cadr x)))
   (get 'user 'theme-settings))
  "List of user-customized variables at init-time.")
(defun my-set-unless (var val &optional comment)
  "Customize value of VAR to VAL if not already set through customize.

Optionally, include COMMENT in the customize definition.

This is a drop-in replacement for `customize-set-variable'."
  (unless (memq var my-customized-variables)
    (funcall #'customize-set-variable var val comment)))

;; Include section headings in Imenu.
;; Example: "^L^J;;; Section heading"
(defun my-add-imenu-package-headings ()
  "Add headings to `imenu-generic-expression'."
  (push
   `("Headings" ,(concat "\\(" (string 12 10) ";;; \\)\\(.*\\)$") 2)
   imenu-generic-expression))

;; This macro allows including code that will only execute if the
;; named package has been selected.  This will not work if a package
;; was installed only as a dependency of another package.  If that
;; happens, you will need to customize `package-selected-packages' and
;; add the name of the package.  But that will be rare.
(defvar package-selected-packages) ; avoid Flymake warning
(defmacro my-if-pkg (pkg &rest forms)
  "If PKG is in `package-selected-packages' execute FORMS."
  (declare (indent 1))
  (require 'package)
  (when (memq pkg package-selected-packages)
    `(progn ,@forms)))

;; Show "^L" characters as horizontal lines in file buffers.  (These
;; characters are used as page-breaks/section dividers.  Use "C-x ["
;; and "C-x ]" to navigate among them.  The bracket keys are in a
;; repeat map, so you don't have to press "C-x" again if repeating.)
(defun xah-show-formfeed-as-line ()
  "Display the formfeed ^L char as line.
URL `http://xahlee.info/emacs/emacs/emacs_form_feed_section_paging.html'
Version 2018-08-30"
  (interactive)
  ;; 2016-10-11 thanks to Steve Purcell's page-break-lines.el
  (progn
    (when (not buffer-display-table)
      (setq buffer-display-table (make-display-table)))
    (aset buffer-display-table ?\^L
          (vconcat (make-list 80 (make-glyph-code ?─ 'font-lock-comment-face))))
    (redraw-frame)))
(add-hook 'find-file-hook 'xah-show-formfeed-as-line)
(add-hook 'help-mode-hook 'xah-show-formfeed-as-line)


;;; !Set default theme

;; To set a different theme, open the "Options: Customize Emacs:
;; Custom Themes" menu entry.

;; Set a theme if one hasn't been chosen.
(my-set-unless 'custom-enabled-themes
	       (if (version< emacs-version "28")
		   '(misterioso)
		 '(modus-vivendi)))


;;; !Package installation

;; Install any selected packages that aren't yet installed.
(package-install-selected-packages 'noconfirm)


;;; Consult

(my-if-pkg consult
  (require 'consult)
  ;; Use `consult-completion-in-region' if neither Company nor Corfu
  ;; are installed.
  (defvar vertico-mode)
  (declare-function consult-completion-in-region nil)
  (unless (or (memq 'company package-selected-packages)
	      (memq 'corfu   package-selected-packages))
    (my-set-unless
     'completion-in-region-function #'consult-completion-in-region)
    (when (memq 'orderless package-selected-packages)
      (consult-customize consult-completion-in-region
			 :completion-styles '(basic orderless)
			 :cycle-threshold 3)))
  (my-set-unless
   'consult-imenu-config
   '((emacs-lisp-mode :toplevel "Headings" :types
		      ((102 "Functions" font-lock-function-name-face)
		       (109 "Macros" font-lock-function-name-face)
		       (112 "Packages" font-lock-constant-face)
		       (116 "Types" font-lock-type-face)
		       (118 "Variables" font-lock-variable-name-face)))))
  (my-set-unless 'consult-narrow-key [60])
  ;; C-x bindings (ctl-x-map)
  (dolist (kb '(("M-:" . consult-complex-command)
		("b" . consult-buffer)
		("4 b" . consult-buffer-other-window)
		("5 b" . consult-buffer-other-frame)
		("r b" . consult-bookmark)
		("p b" . consult-project-buffer)))
    (define-key ctl-x-map (kbd (car kb)) (cdr kb)))
  ;; Custom M-# bindings for fast register access
  (dolist (kb '(("M-#" . consult-register-load)
		("M-'" . consult-register-store)
		("C-M-#" . consult-register)
		;; Other custom bindings
		("M-i" . consult-imenu)
		("M-y" . consult-yank-pop)))
    (global-set-key (kbd (car kb)) (cdr kb)))
  (define-key help-map (kbd "a") 'consult-apropos)
  ;; M-g bindings (goto-map)
  (dolist (kb '(("e" . consult-compile-error)
		("g" . consult-goto-line)
		("M-g" . consult-goto-line)
		("o" . consult-outline)
		("m" . consult-mark)
		("k" . consult-global-mark)
		("i" . consult-imenu)
		("I" . consult-imenu-multi)))
    (define-key goto-map (kbd (car kb)) (cdr kb)))
  (with-eval-after-load 'org
    (defvar org-mode-map)
    (define-key org-mode-map [?\M-g ?h] 'consult-org-heading))
  ;; M-s bindings (search-map)
  (dolist (kb '(("d" . consult-find)
		("D" . consult-locate)
		("g" . consult-grep)
		("G" . consult-git-grep)
		("r" . consult-ripgrep)
		("l" . consult-line)
		("L" . consult-line-multi)
		("m" . consult-multi-occur)
		("k" . consult-keep-lines)
		("u" . consult-focus-lines)
		;; Isearch integration
		("e" . consult-isearch-history)
		("t" . consult-imenu)))
    (define-key search-map (kbd (car kb)) (cdr kb)))
  (with-eval-after-load 'isearch
    (dolist (kb '(("M-s e" . consult-isearch-history)
		  ("M-s l" . consult-line)
		  ("M-s L" . consult-line-multi)))
      (define-key isearch-mode-map (kbd (car kb)) (cdr kb))))
  ;; Minibuffer history
  (dolist
      (kb
       '(("M-s" . consult-history)   ;; orig. next-matching-history-element
	 ("M-r" . consult-history))) ;; orig. previous-matching-history-element
    (define-key minibuffer-local-map (kbd (car kb)) (cdr kb)))

  ;; Optionally configure the register formatting. This improves the register
  ;; preview for `consult-register', `consult-register-load',
  ;; `consult-register-store' and the Emacs built-ins.
  (my-set-unless 'register-preview-delay 0.5)
  (when (fboundp 'consult-register-format)
    (my-set-unless 'register-preview-function #'consult-register-format))

  ;; Optionally tweak the register preview window.
  ;; This adds thin lines, sorting and hides the mode line of the window.
  (when (fboundp 'consult-register-window)
    (advice-add #'register-preview :override #'consult-register-window))

  ;; Optionally replace `completing-read-multiple' with an enhanced version.
  (when (fboundp 'consult-completing-read-multiple)
    (advice-add #'completing-read-multiple
		:override #'consult-completing-read-multiple))

  ;; Use Consult to select xref locations with preview
  (when (fboundp 'consult-xref)
    (my-set-unless 'xref-show-xrefs-function #'consult-xref)
    (my-set-unless 'xref-show-definitions-function #'consult-xref))

  ;; Optionally configure the narrowing key.
  ;; Both < and C-+ work reasonably well.
  (my-set-unless 'consult-narrow-key "<") ;; (kbd "C-+")
  ;; Optionally make narrowing help available in the minibuffer.
  ;; You may want to use `embark-prefix-help-command' or which-key instead.
  ;; (define-key consult-narrow-map (vconcat consult-narrow-key "?")
  ;;   #'consult-narrow-help)
  ;; Configure other variables and modes after lazily loading the
  ;; package.

  ;; Optionally configure preview. The default value
  ;; is 'any, such that any key triggers the preview.
  (my-set-unless 'consult-preview-key 'any)
  
  (define-key goto-map (kbd "f") 'consult-flymake))


;;; Corfu

(my-if-pkg corfu
  ;; (my-set-unless 'corfu-auto-delay 0.4)
  ;; (my-set-unless 'corfu-auto-prefix 4)
  (with-eval-after-load 'corfu
    ;; Turn off `corfu-auto' if it hasn't been turned on by customize.
    (defvar corfu-auto)
    (my-set-unless 'corfu-auto nil))
  (run-at-time 2 nil
	       (lambda () (add-hook 'window-state-change-hook 'corfu-mode))))


;;; Diff-hl

(my-if-pkg diff-hl
  (add-hook 'after-init-hook 'global-diff-hl-mode))


;;; Dired      (built-in)

(with-eval-after-load 'which-key
  (with-eval-after-load 'dired
    (defvar dired-mode-map)
    (define-key dired-mode-map [remap dired-summary]
		'which-key-show-major-mode)))


;;; Dired-aux  (built-in)

(with-eval-after-load 'dired
  (require 'dired-aux))


;;; Dired-x    (built-in)

(with-eval-after-load 'dired
  (require 'dired-x))


;;; Dumb-jump

(my-if-pkg dumb-jump
  (add-hook 'xref-backend-functions 'dumb-jump-xref-activate)
  (my-set-unless
   'xref-show-definitions-function
   'xref-show-definitions-completing-read))


;;; Eglot

(my-if-pkg eglot
  (add-hook 'python-mode-hook 'eglot-ensure)
  (add-hook 'java-mode-hook 'eglot-ensure))


;;; Ehelp      (built-in)

(autoload 'ehelp-command "ehelp"
  "Prefix command for ehelp."
  nil 'keymap)
(global-set-key (kbd "C-h")    'ehelp-command) ;; electric-help
(global-set-key (kbd "<f1>")   'ehelp-command) ;; electric-help
(global-set-key (kbd "<help>") 'ehelp-command) ;; electric-help


;;; Embark

(my-if-pkg embark
  (global-set-key (kbd "C-.") 'embark-act)
  (global-set-key (kbd "M-.") 'embark-dwim)
  (define-key help-map (kbd "B")   'embark-bindings)

  (my-set-unless 'prefix-help-command 'embark-prefix-help-command)

  (add-to-list 'display-buffer-alist
               '("\\`\\*Embark Collect \\(Live\\|Completions\\)\\*"
		 nil
		 (window-parameters (mode-line-format . none))))

  ;; If both 'embark and 'consult are installed, ensure that
  ;; 'embark-consult is also installed, and load it once both of them
  ;; have loaded.
  (when (and (memq 'consult package-selected-packages)
	     (memq 'embark-consult package-selected-packages))
    (with-eval-after-load  'embark
      (with-eval-after-load 'consult
	(require 'embark-consult)
	(add-hook
	 'embark-collect-mode-hook
	 'consult-preview-at-point-mode)))))


;;; Flymake    (built-in)

(with-eval-after-load 'flymake
  (defvar flymake-mode-map)
  (define-key flymake-mode-map (kbd "M-g n")   'flymake-goto-next-error)
  (define-key flymake-mode-map (kbd "M-g M-n") 'flymake-goto-next-error)
  (define-key flymake-mode-map (kbd "M-g p")   'flymake-goto-prev-error)
  (define-key flymake-mode-map (kbd "M-g M-p") 'flymake-goto-prev-error))


;;; Frame      (built-in)

;; Disable the 'suspend-frame command entirely when running in GUI.
;; Although we have changed the "C-z" keybinding (See the "Misc" section),
;; the "C-x C-z" for `suspend-frame' remains.
(when (display-graphic-p) (put 'suspend-frame 'disabled t))


;;; Hippie-exp (built-in)

(global-set-key (kbd "M-/") 'hippie-expand) ;; was 'dabbrev-expand


;;; Hl-line    (built-in)

(with-eval-after-load 'hl-line
  (set-face-attribute 'hl-line nil :extend t))


;;; Ibuffer    (built-in)

;; Use `ibuffer' instead of `list-buffers'
(define-key ctl-x-map (kbd "C-b") 'ibuffer)


;;; Imenu      (built-in)

(unless (memq 'consult package-selected-packages)
  (global-set-key (kbd "M-i") 'imenu))


;;; Isearch    (built-in)

(with-eval-after-load 'isearch
  (dolist (kb '(([up]    . isearch-ring-retreat)
                ([down]  . isearch-ring-advance)
                ([left]  . isearch-repeat-backward)
                ([right] . isearch-repeat-forward)))
    (define-key isearch-mode-map (car kb) (cdr kb)))
  (dolist (kb '(([left]  . isearch-reverse-exit-minibuffer)
                ([right] . isearch-forward-exit-minibuffer)))
    (define-key minibuffer-local-isearch-map (car kb) (cdr kb))))


;;; Lin

(my-if-pkg lin
  (my-set-unless 'lin-face 'lin-blue)
  (my-set-unless
   'lin-mode-hooks
   '(bongo-mode-hook
     dired-mode-hook
     elfeed-search-mode-hook
     git-rebase-mode-hook
     ibuffer-mode-hook
     ilist-mode-hook
     ledger-report-mode-hook
     log-view-mode-hook
     magit-log-mode-hook
     mu4e-headers-mode
     notmuch-search-mode-hook
     notmuch-tree-mode-hook
     occur-mode-hook
     org-agenda-mode-hook
     tabulated-list-mode-hook))
  (with-eval-after-load 'hl-line
    (require 'lin)))


;;; Marginalia

(my-if-pkg marginalia
  ;; If neither Helm nor Ivy are installed.
  (unless (or (memq 'helm package-selected-packages)
	      (memq 'ivy  package-selected-packages))
    (add-hook 'emacs-startup-hook 'marginalia-mode)
    (if (memq 'selectrum package-selected-packages)
	(with-eval-after-load 'selectrum
	  (defvar selectrum-minibuffer-map)
	  (define-key selectrum-minibuffer-map (kbd "M-m") 'marginalia-cycle))
      (define-key minibuffer-local-map (kbd "M-m") 'marginalia-cycle))
    (add-hook 'minibuffer-setup-hook 'marginalia-mode)))


;;; Minibuffer (built-in)

(define-key minibuffer-mode-map (kbd "C-n") 'minibuffer-next-completion)
(define-key minibuffer-mode-map (kbd "C-p") 'minibuffer-previous-completion)
(define-key minibuffer-mode-map (kbd "C-v") 'scroll-other-window)
;; need to fix below, so it doesn't move focus to *Completions* buffer window
;; is there a customization setting for this?
(define-key minibuffer-mode-map (kbd "M-v") 'scroll-other-window-down)
(define-key minibuffer-mode-map (kbd "M-<") 'beginning-of-buffer-other-window)
(define-key minibuffer-mode-map (kbd "M->") 'end-of-buffer-other-window)
(define-key completion-in-region-mode-map (kbd "C-n") 'minibuffer-next-completion)
(define-key completion-in-region-mode-map (kbd "C-p") 'minibuffer-previous-completion)
;; Complementary bindings to make selection easier with Dvorak
(define-key minibuffer-mode-map (kbd "C-s") 'minibuffer-next-completion)
(define-key minibuffer-mode-map (kbd "C-r") 'minibuffer-previous-completion)
(define-key completion-in-region-mode-map (kbd "C-s") 'minibuffer-next-completion)
(define-key completion-in-region-mode-map (kbd "C-r") 'minibuffer-previous-completion)


;;; Minimap

(my-if-pkg minimap
  (global-set-key (kbd "<f9>") 'minimap-mode)
  (my-set-unless 'minimap-window-location 'right))


;;; Misc       (built-in)

(when (display-graphic-p)
  (global-set-key (kbd "C-z")	'zap-up-to-char));; was 'suspend-frame in GUI


;;; Newcomment (built-in)

(global-set-key (kbd "M-;") 'comment-line) ; was 'comment-dwim


;;; Orderless

(my-if-pkg orderless
  (my-set-unless 'completion-styles '(orderless basic))
  (my-set-unless 'completion-category-defaults nil)
  (my-set-unless 'completion-category-overrides
		 '((file (styles partial-completion)))))


;;; Paragraphs (built-in)

(define-key search-map (kbd "R") 'repunctuate-sentences)


;;; Pulsar

(my-if-pkg pulsar
  (add-hook 'after-init-hook 'pulsar-global-mode)
  (my-set-unless 'pulsar-face 'pulsar-generic)
  (my-set-unless 'pulsar-iterations 20)
  (my-set-unless 'pulsar-delay 0.03))


;;; Python     (built-in)

;; Provide indentation guidance without external package.
(defun my-python-indent-highlighting ()
  "Set up highlighting of proper indentation in `python-mode'."
  (setq-local whitespace-line-column nil)
  (setq-local fill-column 79)
  (require 'whitespace)
  (setq-local whitespace-style
	      '(face trailing lines-tail empty indentation::tab big-indent
		     space-after-tab::tab space-before-tab::tab))
  (setq-local tab-width 4)
  (whitespace-mode))


;;; Rainbow-delimiters

(my-if-pkg rainbow-delimiters
  (add-hook 'prog-mode-hook 'rainbow-delimiters-mode))


;;; Simple     (built-in)

(when (version< emacs-version "29")
  (global-set-key (kbd "M-SPC")	'cycle-spacing))      ;; was 'just-one-space
(global-set-key (kbd "M-u")	'upcase-dwim)         ;; was 'upcase-word
(global-set-key (kbd "M-c")	'capitalize-dwim)     ;; was 'capitalize-word
(global-set-key (kbd "M-l")	'downcase-dwim)       ;; was 'downcase-word
;; Delete region when active, instead of just char.
(global-set-key (kbd "C-d")     'delete-forward-char) ;; was 'delete-char


;;; Speedbar   (built-in)

(global-set-key (kbd "<f8>") 'speedbar-get-focus)


;;; Sr-speedbar

(my-if-pkg sr-speedbar
  (global-set-key (kbd "<f8>") 'sr-speedbar-toggle)
   (my-set-unless 'sr-speedbar-default-width 25)
   (my-set-unless 'sr-speedbar-max-width 40)
   (my-set-unless 'sr-speedbar-right-side nil))


;;; Vertico

(my-if-pkg vertico
  (add-hook 'after-init-hook 'vertico-mode)
  (my-set-unless 'vertico-cycle t)
  (with-eval-after-load 'vertico
    (defvar vertico-map)
    ;; Use M-s and M-r to navigate between results (esp. for consult-line)
    (define-key vertico-map (kbd "M-s") 'vertico-next)
    (define-key vertico-map (kbd "M-r") 'vertico-previous)
    (define-key vertico-map (kbd "M-e") 'vertico-quick-exit)
    (define-key vertico-map (kbd "M-i") 'vertico-quick-insert))
  ;; Avoid duplicate menus when using `tmm-menubar' with vertico
  (declare-function tmm-add-prompt "tmm")
  (advice-add #'tmm-add-prompt :after #'minibuffer-hide-completions))


;;; View       (built-in)

(define-key mode-specific-map (kbd "v") 'view-mode)


;;; Which-key

(my-if-pkg which-key
  (require 'which-key)
  (with-eval-after-load 'which-key
    (declare-function which-key-mode nil)
    (which-key-mode 1)
    (dolist (kb '(("t" . which-key-show-top-level)
                  ("M" . which-key-show-major-mode)))
      (define-key help-map (kbd (car kb)) (cdr kb)))))


;;; Window     (built-in)

(global-set-key (kbd "M-o") 'other-window)


;;; Yasnippet

(my-if-pkg yasnippet
  (add-hook 'prog-mode-hook #'yas-minor-mode))



(provide 'init)
;;; init.el ends here
