This is intended as a minimal configuration for Emacs beginners.
The idea is that because it is small, it can easily be built on and
learned from.  Yet it should provide a more pleasing out-of-the-box
experience than starting with no configuration.  Suggestions follow.

This configuration opens this file and any other Emacs Lisp file
with `outline-minor-mode` enabled.  This makes it possible to view
the headings as a list and more easily browse their contents.  To
collapse all headings into a list, enter "C-c @ C-o" To open a
heading and view its contents, click the arrow to the right of the
heading, or place the cursor on the heading and then enter "C-c @
C-s".

A minimal set of third-party packages will be installed on
first-run.  They are:

* ef-themes - a set of attractive and well thought-out themes

* marginalia - useful annotations added to *Completions* lists

* minimap - a miniature sidebar map (open with "f9")

* rainbow-delimiters - matching-color parentheses, brackets, etc

* sr-speedbar - a file/buffer/info browsing sidebar (open with
  "f8") that allows the built-in Speedbar to act as a sidebar
  window, rather than a separate frame

* which-key - automatically view bindings under prefixes like "C-x",
  "C-c", "C-h", "M-s", and "M-g" (or see top-level bindings with "C-h t")
  
* yasnippet + yasnippet-snippets - snippets, and lots of them, to
  ease entry of common text structures.

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

* The built-in completions system has been configured with
  sensible™ defaults.
  
You can access the \*Completions\* buffer by pressing "TAB" or
"C-n" in the minibuffer.  This may be slow if you do it without
narrowing the number of potential completions first.  For example
when you use "C-h v" to get the description of a variable, if you
press "TAB" without entering any text, Emacs will have to compile
a list of all variables it knows, which could take a few seconds.
If that proves to be an annoyance, feel free to "package-install
RET vertico RET".

The Vertico, Consult, Embark, Marginalia, Lin, and Corfu packages
work well together and are recommended for installation.

Diff-hl is also recommended for use with version-control, whether
the built-in `vc-mode` or the external Magit package.

The Eglot package is also recommended, but it must be used with a
any of several "language server" programs that correspond to the
programming language you are writing in.  The language server
runs on your computer, but you must install it separately, using
your operating system's package manager.

The idea is to provide just enough to get started.  Any of these
packages can be removed using the `package-delete` command.  In
addition, several configurations are provided for other external
packages (like vertico).  More packages can be found using the
`list-packages` command, which is also accessible from the menu
above.
