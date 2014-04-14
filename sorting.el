(require 'cl-lib)

;; Manually tell emacs to load the current file that is the library `sorting'.
(when nil
  (let ((load-path (cons "./" load-path)))
    (require 'sorting)))

;; Manually tell emacs to unload all the functions from this file.
(when nil
  (unload-feature 'sorting))

(provide 'sorting)

(defun insertion-sort (arr)
  "Sorts arrays in-place using insertion sort."
  (cl-loop with j = nil
	   with value = nil
	   for i from 1 below (length arr)
	   do
	   (progn (setq value (aref arr i))
		  (setq j (1- i))
		  (cl-loop while (and (>= j 0)
				      (> (aref arr j)
					 value))
			   do
			   (progn (cl-psetf (aref arr (+ j 1)) (aref arr j)
					    (aref arr j) (aref arr (+ j 1)))
				  (cl-decf j)))
		  (setf (aref arr (+ 1 j)) value))
	   finally return arr))

(let ((arr (vector 6 5 4 3 2 1)))
  (insertion-sort arr))
