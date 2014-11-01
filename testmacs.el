(provide 'testmacs)

(defvar *tm-package* nil)
(defvar *tm-suite* nil)


(defun tm-read-testspec ()
  (interactive)
  (setq *tm-package*
	(read-string "test-package: "))
  (setq *tm-suite*
	(read-string "test-suite: ")))

(defun tm-run-testspec-in-repl ()
  (slime-repl-send-string
   (format "(5am:run! '%s::%s)"
	   *tm-package* *tm-suite*)))

(defun tm-run-testspec ()
  (interactive)
  (tm-read-testspec)
  (tm-run-testspec-in-repl))

(defun tm-run-last-testspec ()
  (interactive)
  (when (not (and *tm-package*
		  *tm-suite*))
    (tm-read-testspec))
  (tm-run-testspec-in-repl))

