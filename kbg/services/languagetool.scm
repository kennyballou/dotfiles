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
  #:use-module (kbg packages ltex-ls))

(define-public languagetool-shepherd-service
  (shepherd-service
   (provision '(languagetool))
   (requirement '())
   (documentation "Run a local LanguageTool Server.")
   (start #~(make-forkexec-constructor
             (list #$(file-append openjdk "/bin/java")
                   "-classpath"
                   #$(file-append languagetool "/languagetool-server.jar")
                   "org.languagetool.server.HTTPServer"
                   "--port"
                   "9090"
                   "--languageModel"
                   #$(file-append languagetool-ngram-en "/share/LanguageTool-grams/"))
             #:log-file ".share/var/log/languagetool.log"))
   (stop #~(make-kill-destructor))))

(define-public ltex-shepherd-service
  (shepherd-service
   (provision '(ltex-ls))
   (requirement '(languagetool))
   (documentation "Run TCP LTEX LanguageServer which uses LanguageTool")
   (start #~(make-forkexec-constructor
             (list #$(file-append openjdk "/bin/java")
                   "-classpath"
                   #$(file-append ltex-ls "/lib/*:")
                   "org.bsplines.ltexls.LtexLanguageServerLauncher"
                   "--host=localhost"
                   "--port=9091"
                   "--server-type=TcpSocket")))
   ;; #:log-file ".local/var/log/ltex-ls.log"))
   (stop #~(make-kill-destructor))))

(define-public languagetool-service
  (list languagetool-shepherd-service
        ltex-shepherd-service))
