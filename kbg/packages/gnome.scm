(define-module (kbg packages gnome)
  #:use-module (ice-9 match)
  #:use-module (gnu)
  #:use-module (guix)
  #:use-module (guix records)
  #:use-module (gnu packages gnome)
  #:use-module (kbg packages gnome-keyring)
  #:export (gnome-sans-ssh-agent))

(define gnome-sans-ssh-agent
  (package
    (inherit gnome)
    (name "gnome-sans-ssh-agent")
    (propagated-inputs
     (map (match-lambda
            ((name package)
             (if (equal? name "gnome-keyring")
                 (list name gnome-keyring-sans-ssh-agent)
                 (list name package))))
          (package-propagated-inputs gnome)))))
