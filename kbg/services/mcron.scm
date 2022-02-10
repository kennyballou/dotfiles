(define-module (kbg services mcron)
  #:use-module (kbg)
  #:use-module (kbg private-data)
  #:use-module (guix gexp)
  #:use-module (gnu)
  #:use-module (gnu home)
  #:use-module (gnu home services)
  #:use-module (gnu home services mcron)
  #:use-module (gnu services)
  #:use-module (gnu packages)
  #:use-module (gnu packages backup)
  #:use-module (gnu packages guile-xyz)
  #:use-module (mcron base)
  #:use-module (mcron job-specifier)
  #:export (mcron-service))

(define mcron-service
  (list (service home-mcron-service-type
                 (home-mcron-configuration
                  (jobs (list #~(job "0 * 0 0 0"
                                     (lambda ()
                                       (system (string-append borg "/bin/borg")
                                               "create"
                                               "--stats"
                                               "--progress"
                                               "--show-rc"
                                               "--compression lz4"
                                               "--exclude-caches"
                                               "--exclude 'node_modules'"
                                               "--exclude '/home/*/.cache/*'"
                                               "--exclude '/home/*/tmp/*'"
                                               "--exclude '/home/*/guixtest/*'"
                                               "--exclude '/home/*/.var/*'"
                                               "--exclude '/home/*/.config/Element/*'"
                                               "--exclude '/home/*/.config/Signal/*'"
                                               "--exclude '/home/*/.config/Slack/*'"
                                               "--exclude '/home/*/.local/share/Zeal/*'"
                                               "--remote-ratelimit 2000"
                                               (string-append %borg-repository "::$(hostname)-$(uuidgen --time)"
                                                              "/home/kb/")))
                                     "Borg Backup Creation")
                              #~(job "10 * 0 0 0"
                                     (lambda ()
                                       (system (string-append borg "/bin/borg")
                                               "prune"
                                               "--stats"
                                               "--progress"
                                               "--show-rc"
                                               "--keep-hourly=24"
                                               "--keep-daily=7"
                                               "--keep-weakly=4"
                                               "--keep-monthly=6"
                                               "--keep-yearly=2"
                                               "--prefix=$(hostname)"
                                               %borg-repository))
                                     "Borg Backup Pruning")))))))
