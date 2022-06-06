;; https://git.genenetwork.org/guix-bioinformatics/guix-bioinformatics/src/commit/e8b5eed0f1bef00f532f11c123cb579bc4e9fef6/gn/services/science.scm
(define-module (kbg services slurm)
  #:use-module (ice-9 match)
  #:use-module (gnu)
  #:use-module (guix records)
  #:use-module (gnu services shepherd)
  #:use-module (gnu packages admin)
  #:use-module (gnu packages parallel)
  #:export (munge-configuration
            munge-configuration?
            munge-service-type
            slurm-configuration
            slurm-configuration?
            slurm-service-type))

(define %munge-accounts
  (list (user-group
         (name "munge")
         (id 900)
         (system? #t))
        (user-account
         (name "munge")
         (group "munge")
         (uid 900)
         (system? #t)
         (home-directory "/var/lib/munge")
         (shell (file-append shadow "/sbin/nologin")))))

(define-record-type* <munge-configuration>
  munge-configuration
  make-munge-configuration
  munge-configuration?
  (package munge-configuration-package
           (default munge))
  (socket munge-configuration-socket
          (default "/var/run/munge/munge.socket.2"))
  (pid-file munge-configuration-pid-file
            (default "/var/run/munge/munged.pid"))
  (log-file munge-configuration-log-file
            (default "/var/log/munge/munged.log"))
  (key munge-configuration-key
       (default "/etc/munge/munge.key")))

(define (munge-activation config)
  "Return the activation GEXP for CONFIG for the munge service."
  (with-imported-modules '((guix build utils))
    #~(begin
        (define %user (getpw "munge"))
        (let* ((homedir (passwd:dir %user))
               (key     #$(munge-configuration-key config))
               (etc-dir (dirname key))
               (run-dir (dirname #$(munge-configuration-pid-file config)))
               (log-dir (dirname #$(munge-configuration-log-file config))))
          (for-each (lambda (dir)
                      (unless (file-exists? dir)
                        (mkdir-p dir))
                      (chown dir (passwd:uid %user) (passwd:gid %user))
                      (chmod dir #o700))
                    (list homedir etc-dir log-dir))
          (unless (file-exists? key)
            (invoke #$(file-append (munge-configuration-package config)
                                 "/sbin/mungekey")
                    "--create"
                    (string-append "--bits=" (number->string (* 8 1024))) ; bits, not bytes
                    (string-append "--keyfile=" key)))
          (chown key (passwd:uid %user) (passwd:gid %user))
          (chmod key #o400)
          (unless (file-exists? run-dir)
            (mkdir-p run-dir))
          (chown run-dir (passwd:uid %user) (passwd:gid %user))))))

(define munge-shepherd-service
  (match-lambda
    (($ <munge-configuration> package socket pid-file log-file key)
     (list
      (shepherd-service
       (documentation "Munge server")
       (provision '(munge))
       (requirement '(loopback user-processes))
       (start #~(make-forkexec-constructor
                 (list #$(file-append package "/sbin/munged")
                       "--foreground"
                       (string-append "--socket=" #$socket)
                       (string-append "--key-file=" #$key)
                       (string-append "--pid-file=" #$pid-file)
                       (string-append "--log-file=" #$log-file))
                 #:user "munge"
                 #:group "munge"
                 #:pid-file #$pid-file
                 #:log-file #$log-file))
       (stop #~(lambda _
                 (not (and
                       (list #$(file-append package "/sbin/munged")
                             (string-append "--socket=" #$socket)
                             "--stop")
                       (delete-file (string-append #$socket ".lock"))))))
       (auto-start? #t))))))

(define munge-service-type
  (service-type
   (name 'munge)
   (extensions
    (list
     (service-extension shepherd-root-service-type
                        munge-shepherd-service)
     (service-extension activation-service-type
                        munge-activation)
     (service-extension account-service-type
                        (const %munge-accounts))
     (service-extension profile-service-type
                        (compose list munge-configuration-package))))
   (default-value (munge-configuration))
   (description
    "Run @url{https://dun.github.io/munge/,Munge}, an authentication service.")))

(define %slurm-accounts
  (list (user-group
         (name "slurm")
         (id 901)
         (system? #t))
        (user-account
         (name "slurm")
         (group "slurm")
         (uid 901)
         (system? #t)
         (home-directory "/var/lib/slurm")
         (shell (file-append shadow "/sbin/nologin")))))

(define-record-type* <slurm-configuration>
  slurm-configuration
  make-slurm-configuration
  slurm-configuration?
  ;; As I understand it, all the services depend on also running slurmd on
  ;; that machine.  Therefore it makes sense to have one config section with
  ;; "common" and "extended" options.  With all the possible options and
  ;; versions we only cover the ones which affect the services.
  ;; We keep the capitalization used in the config files to make discovery easier.
  (package              slurm-configuration-package
                        (default slurm))
  (slurm-conf-file      slurm-configuration-slurm-conf-file
                        (default "/etc/slurm/slurm.conf"))
  (SlurmdLogFile        slurm-configuration-slurmd-log-file
                        (default #f))           ; #f for syslog
  (SlurmdPidFile        slurm-configuration-slurmd-pidfile
                        (default "/var/run/slurmd.pid"))

  (SlurmdSpoolDir       slurm-configuration-slurmd-spooldir
                        (default "/var/spool/slurmd"))

  (run-slurmctld?       slurm-configuration-run-slurmctld
                        (default #f))
  (SlurmctldLogFile     slurm-configuration-slurmctld-log-file
                        (default #f))           ; #f for syslog
  (SlurmctldPidFile     slurm-configuration-slurmctld-pidfile
                        (default "/var/run/slurmctld.pid"))

  (run-slurmdbd?        slurm-configuration-run-slurmdbd
                        (default #f))
  (slurmdbd-conf-file   slurm-configuration-slurmdbd-conf-file
                        (default "/etc/slurm/slurmdbd.conf"))
  (slurmdbd-PidFile     slurm-configuration-slurmdbd-pidfile
                        (default "/var/run/slurmdbd.pid"))

  (ClusterName          slurm-configuration-clustername
                        (default #f))           ; string
  (SlurmUser            slurm-configuration-slurmuser
                        (default #f))           ; string
  (SlurmctldHost        slurm-configuration-slurmctldhost
                        (default #f))           ; list of strings
  (slurm-extra-content  slurm-configuration-slurm-extra-content
                        (default ""))
  (cgroup-extra-content slurm-configuration-cgroup-extra-content
                        (default ""))
  (DbdHost              slurm-configuration-dbdhost
                        (default #f))           ; string
  (StorageType          slurm-configuration-storagetype
                        (default #f))           ; string
  (slurmdbd-extra-content slurm-configuration-slurmdbd-extra-content
                         (default "")))


(define (%slurm.conf config)
  "Return a slurm.conf configuration file corresponding to CONFIG."
  (computed-file
    "slurm_conf"
    #~(begin
        (use-modules (srfi srfi-26))
        (call-with-output-file #$output
          (lambda (port)
            (display "# Generated by 'slurm-service'.\n" port)
            (format port "ClusterName=~a\n"
                    #$(slurm-configuration-clustername config))
            (for-each
              (cut format port "SlurmCtldHost=~a\n" <>)
              '#$(slurm-configuration-slurmctldhost config))
            (format port "SlurmdSpoolDir=~a\n"
                    #$(slurm-configuration-slurmd-spooldir config))
            (format port "SlurmdPidFile=~a\n"
                    #$(slurm-configuration-slurmd-pidfile config))
            (when #$(slurm-configuration-slurmd-log-file config)
              (format port "SlurmdLogFile=~a\n"
                      #$(slurm-configuration-slurmd-log-file config)))
            (format port "SlurmctldPidFile=~a\n"
                    #$(slurm-configuration-slurmctld-pidfile config))
            (when #$(slurm-configuration-slurmctld-log-file config)
              (format port "SlurmctldLogFile=~a\n"
                      #$(slurm-configuration-slurmctld-log-file config)))
            (format port "SlurmUser=~a\n"
                    #$(slurm-configuration-slurmuser config))
            (format port "\n# Extra content here:\n~a\n"
                    #$(slurm-configuration-slurm-extra-content config))
            #t)))))

(define (%cgroup.conf config)
  "Return a cgroup.conf configuration file corresponding to CONFIG."
  (computed-file
    "cgroup_conf"
    #~(begin
        (call-with-output-file #$output
          (lambda (port)
            (display "# Generated by 'slurm-service'.\n" port)
            (format port "~a\n"
                    #$(slurm-configuration-cgroup-extra-content config)))))))

(define (%slurmdbd.conf config)
  "Return a slurm.conf configuration file corresponding to CONFIG."
  (computed-file
    "slurmdbd_conf"
    #~(begin
        (call-with-output-file #$output
          (lambda (port)
            (display "# Generated by 'slurm-service'.\n" port)
            (format port "DbdHost=~a\n"
                    #$(slurm-configuration-dbdhost config))
            (format port "StorageType=~a\n"
                    #$(slurm-configuration-storagetype config))
            (format port "SlurmUser=~a\n"
                    #$(slurm-configuration-slurmuser config))
            (format port "PidFile=~a\n"
                    #$(slurm-configuration-slurmdbd-pidfile config))
            (format port "\n# Extra content here:\n~a\n"
                    #$(slurm-configuration-slurmdbd-extra-content config))
            #t)))))

(define (slurm-activation config)
  "Return the activation GEXP for CONFIG for the slurm service."
  (with-imported-modules '((guix build utils))
    #~(begin
        (use-modules (guix build utils))
        (let* ((%user       (getpw "slurm"))
               (spooldir    #$(slurm-configuration-slurmd-spooldir config))
               (logdir      (dirname (or #$(slurm-configuration-slurmd-log-file config)
                                         #$(slurm-configuration-slurmctld-log-file config)
                                         "/var/log/slurmd.log")))
               (piddir      (dirname #$(slurm-configuration-slurmd-pidfile config))))
          (unless (file-exists? spooldir)
            (mkdir-p spooldir))
          (chown spooldir (passwd:uid %user) (passwd:gid %user))
          (when logdir
            (unless (file-exists? logdir)
              (mkdir-p logdir))
            (when (> (string-length logdir) (string-length "/var/log"))
              (chown logdir (passwd:uid %user) (passwd:gid %user))))
          (unless (file-exists? piddir)
            (mkdir-p piddir)))
        ;; /etc/slurm/slurm.conf needs to exist.
        (file-exists? #$(slurm-configuration-slurm-conf-file config))
        ;; slurmdbd activation
        (when #$(slurm-configuration-run-slurmdbd config)
          (file-exists?
            #$(slurm-configuration-slurmdbd-conf-file config))))))

(define slurmd-shepherd-service
  (match-lambda
    (($ <slurm-configuration> package slurm-conf-file _ slurmd-pidfile)
     (list
       (shepherd-service
         (documentation "Slurmd server")
         (provision '(slurmd))
         (requirement '(loopback munge))
         (start #~(make-forkexec-constructor
                    (list #$(file-append package "/sbin/slurmd")
                          "-f" #$slurm-conf-file)
                    #:pid-file #$slurmd-pidfile))
         (stop #~(make-kill-destructor)))))))

(define slurmctld-shepherd-service
  (match-lambda
    (($ <slurm-configuration> package slurm-conf-file _ _ _ run-slurmctld? _ slurmctld-pidfile)
     (list
       (shepherd-service
         (documentation "Slurmctld server")
         (provision '(slurmctld))
         (requirement '(loopback munge))
         (start #~(make-forkexec-constructor
                    (list #$(file-append package "/sbin/slurmctld")
                          "-f" #$slurm-conf-file)
                    #:pid-file #$slurmctld-pidfile))
         (stop #~(make-kill-destructor))
         (auto-start? run-slurmctld?))))))

(define slurmdbd-shepherd-service
  (match-lambda
    (($ <slurm-configuration> package _ _ _ _ _ _ _ run-slurmdbd? _ slurmdbd-pidfile)
     (list
       (shepherd-service
         (documentation "Slurmdbd server")
         (provision '(slurmdbd))
         (requirement '(loopback munge))
         (start #~(make-forkexec-constructor
                    (list #$(file-append package "/sbin/slurmdbd"))
                    #:pid-file #$slurmdbd-pidfile))
         (stop #~(make-kill-destructor))
         (auto-start? run-slurmdbd?))))))

(define (slurm-services-to-run config)
  (append (slurmd-shepherd-service config)
          (if (slurm-configuration-run-slurmctld config)
            (slurmctld-shepherd-service config)
            '())
          (if (slurm-configuration-run-slurmdbd config)
            (slurmdbd-shepherd-service config)
            '())))

(define (slurm-etc-service config)
  (append
    `(("slurm/slurm.conf" ,(%slurm.conf config))
      ("slurm/cgroup.conf" ,(%cgroup.conf config)))
    (if (slurm-configuration-run-slurmdbd config)
      `(("slurm/slurmdbd.conf" ,(%slurmdbd.conf config)))
      '())))

(define slurm-service-type
  (service-type
    (name 'slurm)
    (extensions
      (list
        (service-extension shepherd-root-service-type
                           slurm-services-to-run)
        (service-extension activation-service-type
                           slurm-activation)
        (service-extension etc-service-type
                           slurm-etc-service)
        (service-extension account-service-type
                           (const %slurm-accounts))
        (service-extension profile-service-type
                           (compose list slurm-configuration-package))))
    (default-value (slurm-configuration))
    (description
     "Run @url{https://slurm.schedmd.com/slurm.html,Slurm}, a workflow manager
service.  Optionally also run @code{slurmctld} and @code{slurmdbd}.")))
