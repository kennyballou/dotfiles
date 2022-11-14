(define-module (kbg services languagetool)
  #:use-module (kbg)
  #:use-module (gnu)
  #:use-module (guix)
  #:use-module (gnu services)
  #:use-module (gnu services shepherd)
  #:use-module (gnu home services)
  #:use-module (gnu home services shepherd)
  #:use-module (gnu packages java)
  #:use-module (kbg packages languagetool)
  #:export (languagetool-service))

(define languagetool-service
  (let* ((languagetool-server (shepherd-service
                                (provision '(languagetool))
                                (requirement '())
                                (documentation "Run a local LanguageTool Server.")
                                (start #~(make-forkexec-constructor
                                          (list #$(file-append openjdk "/bin/java")
                                                "-classpath"
                                                #$(file-append languagetool "/languagetool-server.jar")
                                                "org.languagetool.server.HTTPServer"
                                                "--port"
                                                "9090")))
                                (stop #~(make-kill-destructor)))))
    (list languagetool-server)))
