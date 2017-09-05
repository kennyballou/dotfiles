(defun browse-current-file ()
  "Open current file as a URL using `browse-url'."
  (interactive)
  (let ((file-name (buffer-file-name)))
    (if (and (fboundp 'tramp-tramp-file-p)
             (tramp-tramp-file-p file-name))
        (error "cannot open tramp file")
      (browse-url (concat "file://" file-name)))))

(provide 'init-utils)
