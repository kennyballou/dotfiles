(defvar *my-request-resource-handlers* '())

(load-after-system :nx-freestance-handler
                   (nyxt-init-file "freestance.lisp"))

(define-configuration web-buffer
    ((request-resource-hook
      (reduce #'hooks:add-hook
              (mapcar #'make-handler-resource
                      *my-request-resource-handlers*)
              :initial-value %slot-default%))))

(define-configuration web-buffer
    ((default-modes (append '(blocker-mode) %slot-default%))))

(define-configuration buffer
    ((default-modes (append '(emacs-mode) %slot-default%))))
