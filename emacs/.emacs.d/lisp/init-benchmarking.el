;;; init-benchmarking --- Benchmarking required packages
;;; Commentary:
;;; Code:

(defun sanityinc/time-subtract-millis (a b)
  "Return differece of A - B seconds as milliseconds."
  (* 1000.0 (float-time (time-subtract a b))))

(defun sanityinc/show-init-times ()
  "Display initialization times in messages."
  (message "init completed in %.2fms"
           (sanityinc/time-subtract-millis after-init-time before-init-time)))

(add-hook 'after-init-hook 'sanityinc/show-init-times)

(provide 'init-benchmarking)
;;; init-benchmarking.el ends here
