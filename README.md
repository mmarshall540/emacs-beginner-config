# emacs-beginner-config

This is intended as a minimal configuration for Emacs beginners.
The idea is that because it is small, it can easily be built on and
learned from.  Yet it should provide a more pleasing out-of-the-box
experience than starting with no configuration.  Suggestions follow.

This configuration will open the "init.el" file and any other Emacs
Lisp file with `outline-minor-mode` enabled.  This makes it possible
to view the headings as a list and more easily browse their contents.
To collapse all headings into a list, enter "C-c @ C-o".  To open a
heading and view its contents, click the arrow to the right of the
heading using your mouse, or place the cursor on the heading and then
enter "C-c @ C-s".

A small collection of external packages will be installed on
first-run.  They are:

* dumb-jump - Jump to the definition of the symbol at point by
  pressing "M-.", and return when done by pressing "M-,".

* ef-themes - A set of attractive and well-thought-out themes.  A
  built-in theme is selected on first run, but you can select a
  different one from this package or another by doing "M-x
  customize-themes RET".

* marginalia - Adds useful annotations added to \*Completions\* lists.
  It's also used by Vertico if that's installed.

* minimap - A miniature sidebar map (open with "f9").

* rainbow-delimiters - Matching parentheses and brackets are easily
  identified by their matching colors.  If you find this distracting,
  do "M-x package-delete RET rainbow-delimiters" to remove the
  package.  An alternative and less distracting way to match pairs is
  to use the built-in `show-paren-mode`, which you can enable from the
  Options menu by checking the box next to "Highlight Matching
  Parentheses".

* sr-speedbar - A file/buffer/info browsing sidebar (open with "f8").
  This package allows the built-in Speedbar to act as a sidebar
  window, rather than a separate frame.

* vertico - A more polished completion system, which automatically
  pops-up without delay and updates the list of completion candidates
  as you type.

* which-key - Emacs has a lot of keybindings.  And a lot of commands
  require a sequence of keys, not just one.  This package
  automatically shows you the available keybindings in a pop-up
  whenever you press a prefix key like "C-x", "C-c", "C-h", "M-s", or
  "M-g".  To see top-level bindings that are available without using a
  prefix key, press "C-h t".
  
* yasnippet + yasnippet-snippets - Snippets, and lots of them, to ease
  entry of common text structures.  These are accessible from the
  menu-bar or by entering a trigger-abbreviation and pressing "TAB".

There are other intended-to-be-helpful preconfigured settings, such
as:

* Indentation highlighting in Python files using the built-in
  `whitespace-mode`

* Linefeeds (aka pagebreaks) displayed as horizontal lines, rather
  than the unslightly "^L" character

* Enhanced built-in commands which don't come enabled by default
  are enabled here, such as `cycle-spacing` instead of
  `just-one-space` ("M-SPC"), and `ibuffer` instead of
  `list-buffers` ("C-x C-b")

The configuration sections of packages that are not installed will be
skipped.  And settings that have been customized (via the "Easy
Customization" interface or one of the `customize` commands) will
override settings found in the main init file.

The Eglot package would have been included by default, but it must be
used with a "language server" program that corresponds to the
programming language you are writing in.  The language server runs on
your computer, but you must install it separately, using your
operating system's package manager.

The author prefers to disable certain user-interface features such as
`scroll-bar-mode` and `tool-bar-mode` but will not assume that others
share that preference.  You can toggle those features (and many
others) from the Options menu within the "Show/Hide" submenu.

Changes to the defaults made via `customize` are saved to a separate
"my-custom.el" file, which is created on first run.

The idea is to provide an attractive starting point for your Emacs
configuration in a single init file that stays relatively close to
so-called "vanilla" Emacs.  Of course, you can (and should) change the
configuration as you see fit.
