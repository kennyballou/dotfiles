(define-module (kbg))

(define-public %home (getenv "HOME"))
(define-public %dotfiles-root (string-append (getcwd) "/"))
