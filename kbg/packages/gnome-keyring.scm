(define-module (kbg packages gnome-keyring)
  #:use-module (gnu)
  #:use-module (guix)
  #:use-module (guix records)
  #:use-module (gnu packages)
  #:use-module (gnu packages gnome)
  #:export (gnome-keyring-sans-ssh-agent))

(define gnome-keyring-sans-ssh-agent
  (package
    (inherit gnome-keyring)
    (name "gnome-keyring-sans-ssh-agent")
    (arguments
     (substitute-keyword-arguments
         (package-arguments gnome-keyring)
       ((#:configure-flags flags)
        `(cons "--disable-ssh-agent" ,flags))))))
