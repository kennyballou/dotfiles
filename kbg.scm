(define-module (kbg))

(define-public %home (getenv "HOME"))
(define-public %dotfiles-root (string-append (getcwd) "/"))

(define-public (filter-packages excluded-pkgs pkgs)
  (filter (lambda (p) (not (member p excluded-pkgs))) pkgs))
