(define-module (kbg services languagetool)
  #:use-module (kbg)
  #:use-module (gnu)
  #:use-module (guix)
  #:use-module (gnu packages python)
  #:use-module (gnu services)
  #:use-module (gnu services shepherd)
  #:use-module (gnu home services)
  #:use-module (gnu home services shepherd)
  #:use-module (gnu packages java)
  #:use-module (kbg packages languagetool)
  #:use-module (kbg packages ltex-ls)
  #:use-module (kbg packages python-xyz))

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
                   #$(file-append languagetool-ngram-en "/share/LanguageTool-ngrams/"))
             #:log-file (format #f "~a/languagetool.log"
                                (or (getenv "XDG_LOG_HOME")
                                    (format #f "~a/.local/var/log"
                                            (getenv "HOME"))))))
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

(define-public yalafi-shepherd-service
  (shepherd-service
   (provision '(yalafi))
   (requirement '(languagetool))
   (documentation "Run YaLafi to filter markup for LanguageTool.  Forks itself WITH pidfile.")
   (start #~(make-forkexec-constructor
             (list #$(file-append python-minimal-wrapper "/bin/python")
                   "-m"
                   "yalafi.shell"
                   "--pidfile"
                   (format #f "/run/user/~a/yalafi.pid" (getuid))
                   "--server"
                   "http://localhost:9090/v2/check"
                   "--as-server"
                   "9092")
             #:pid-file (format #f "/run/user/~a/yalafi.pid" (getuid))
             #:log-file (format #f "~a/yalafi.log"
                                (or (getenv "XDG_LOG_HOME")
                                    (format #f "~a/.local/var/log"
                                            (getenv "HOME"))))
             #:environment-variables (append (list (string-append
                                                    "PYTHONPATH="
                                                    #$(file-append python-yalafi-custom-server
                                                                   "/lib/python3.9/site-packages/")))
                                             (default-environment-variables))))
   (stop #~(make-kill-destructor))))

(define-public languagetool-service
  (list languagetool-shepherd-service
        yalafi-shepherd-service))
