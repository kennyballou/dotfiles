;;; init-astronomical --- astronomical emacs
;;; Commentary:
;;; https://orgmode.org/worg/org-hacks.html#org790bd5a
;;; https://orgmode.org/worg/org-hacks.html#orgf1fe951
;;; Code:

(require 'cl-lib)
(require 'lunar)
(require 'solar)

(setq lunar-phase-names
      '("🌑 New Moon"
        "🌓 First Quarter Moon"
        "🌕 Full Moon"
        "🌗 Last Quarter Moon"))

(with-suppressed-warnings ((lexical date))
    (defvar date))
(defun kb/diary-lunar-phases ()
  "Show lunar phase in Agenda Buffer."
  (let* ((phase-list (lunar-phase-list (nth 0 date) (nth 2 date)))
         (phase (cl-find-if (lambda (phase) (equal (car phase) date))
                            phase-list)))
    (when phase
      (concat (lunar-phase-name (nth 2 phase)) " "
              (substring (nth 1 phase) 0 5)))))

(defun kb/diary-solar-sunrise ()
  "Show sunrise in Agenda Buffer."
  (let ((sunrise (car (car (solar-sunrise-sunset date)))))
    (concat "Sunrise " (solar-time-string sunrise nil))))

(defun kb/diary-solar-sunset ()
  "Show sunset in agenda buffer."
  (let ((sunset (car (cadr (solar-sunrise-sunset date)))))
    (concat "Sunset " (solar-time-string sunset nil))))

(provide 'init-astronomical)
;;; init-astronimical.el ends here
