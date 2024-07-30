(define-module (kbg services config languagetool)
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

(define (languagetool-service-file)
  (mixed-text-file "LanguageTool.service"
                   "[Unit]"
                   "\n"
                   "Description=Local LanguageTool HTTP Server"
                   "\n"
                   "[Service]"
                   "\n"
                   "Type=simple"
                   "\n"
                   "ExecStart=guix time-machine --channels=%E/guix/channels.scm -- shell openjdk LanguageTool -- java -classpath " languagetool "/languagetool-server.jar org.languagetool.server.HTTPServer --port 9090 --languageModel " languagetool-ngram-en "/share/LanguageTool-ngrams/"
                   "\n"
                   "[Install]"
                   "\n"
                   "WantedBy=default.target"
                   "\n"))

(define (yalafi-service-file)
  (mixed-text-file "yalafi.service"
                   "[Unit]"
                   "\n"
                   "Description=YaLafi HTTP Proxy for LaTeX LT requests"
                   "\n"
                   "Requires=LanguageTool"
                   "\n"
                   "[Service]"
                   "\n"
                   "Type=simple"
                   "\n"
                   "PIDFile=/run/user/%U/yalafi.pid"
                   "\n"
                   "Environment=\"PYTHONPATH=" python-yalafi-custom-server "/lib/python3.10/site-packages/\""
                   "\n"
                   "ExecStart=guix time-machine --channels=%E/guix/channels.scm -- shell python-minimal-wrapper -- python -m yalafi.shell --pidfile=/run/user/%U/yalafi.pid --server http://localhost:9090/v2/check --as-server 9092"
                   "\n"
                   "[Install]"
                   "\n"
                   "WantedBy=default.target"
                   "\n"))

(define-public languagetool-systemd
  (list (simple-service 'languagetool-systemd-files
                        home-files-service-type
                        `((".config/systemd/user/LanguageTool.service"
                           ,(languagetool-service-file))
                          (".config/systemd/user/YaLafi.service"
                           ,(yalafi-service-file))))))
