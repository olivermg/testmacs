(provide 'testmacs)

(defvar *package* nil)
(defvar *suite* nil)


(defun tm-read-testspec ()
  (interactive)
  (setq *package*
	(read-string "test-package: "))
  (setq *suite*
	(read-string "test-suite: ")))

(defun tm-run-testspec-in-repl ()
  (slime-repl-send-string
   (format "(5am:run! '%s::%s)"
	   *package* *suite*)))

(defun tm-run-testspec ()
  (interactive)
  (tm-read-testspec)
  (tm-run-testspec-in-repl))

(defun tm-run-last-testspec ()
  (interactive)
  (when (not (and *package*
		  *suite*))
    (tm-read-testspec))
  (tm-run-testspec-in-repl))

