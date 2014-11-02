## Usage

Insert into your ~/.emacs file something like:

```lisp
(add-to-list 'load-path "~/testmacs-dir")

(require 'testmacs)

(global-set-key (kbd "C-c C-\\") 'tm-run-last-testspec)
(global-set-key (kbd "C-c C-'") 'tm-run-testspec)
```

## Restrictions

Currently, only one testing framework, namely [fiveam](http://common-lisp.net/project/fiveam/) is hardwired into the script.
