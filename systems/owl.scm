(define-module (systems owl)
  #:use-module (guix)
  #:use-module (guix records)
  #:use-module (guix utils)
  #:use-module (gnu)
  #:use-module (gnu packages)
  #:use-module (gnu services avahi)
  #:use-module (gnu services base)
  #:use-module (gnu services cups)
  #:use-module (gnu services dbus)
  #:use-module (gnu services desktop)
  #:use-module (gnu services linux)
  #:use-module (gnu services mcron)
  #:use-module (gnu services networking)
  #:use-module (gnu services nix)
  #:use-module (gnu services pm)
  #:use-module (gnu services security-token)
  #:use-module (gnu services ssh)
  #:use-module (gnu services xorg)
  #:use-module (gnu system nss)
  #:use-module (gnu packages cups)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages linux)
  #:use-module (nongnu packages linux)
  #:use-module (nongnu packages mozilla)
  #:use-module (nongnu packages printers)
  #:use-module (nongnu system linux-initrd)
  #:use-module (kbg)
  #:use-module (kbg packages profiles base)
  #:use-module (kbg packages profiles desktop)
  #:use-module (kbg packages gnome)
  #:use-module (kbg services desktop)
  #:use-module (kbg services nftables)
  #:use-module (kbg services slurm)
  #:use-module ((kbg system mcron) :prefix mcron:)
  #:use-module (kbg system xorg))

(define owl-system
  (operating-system
   (kernel linux-lts)
   (firmware (list linux-firmware))
   (initrd microcode-initrd)
   (host-name "owl")
   (timezone "America/Boise")
   (locale "en_US.utf8")

   (initrd-modules (append (list "dm-raid" "raid1")
			   %base-initrd-modules))

   (keyboard-layout (keyboard-layout "us" #:options '("ctrl:nocaps")))

   (bootloader (bootloader-configuration
                (bootloader grub-efi-removable-bootloader)
                (targets '("/boot/efi"))
                (keyboard-layout keyboard-layout)))

   (mapped-devices
    (list (mapped-device
	   (source (list "/dev/nvme0n1p1" "/dev/nvme1n1p1"))
	   (target "/dev/md124")
	   (type raid-device-mapping))
	  (mapped-device
	   (source (list "/dev/nvme0n1p2" "/dev/nvme1n1p2"))
	   (target "/dev/md125")
	   (type raid-device-mapping))
	  (mapped-device
	   (source (list "/dev/sda1" "/dev/sdb1"))
	   (target "/dev/md126")
	   (type raid-device-mapping))
	  (mapped-device
	   (source (list "/dev/sdc1" "/dev/sdd1"))
	   (target "/dev/md127")
	   (type raid-device-mapping))
	  (mapped-device
	   (source "vg0")
	   (targets (list "vg0-root" "vg0-opt" "vg0-tmp"))
	   (type lvm-device-mapping))
	  (mapped-device
	   (source "vg1")
	   (targets (list "vg1-guix" "vg1-nix" "vg1-swap" "vg1-var"))
	   (type lvm-device-mapping))
	  (mapped-device
	   (source "vg2")
	   (targets (list "vg2-home"))
	   (type lvm-device-mapping))))

   (file-systems (append (list (file-system
				(device "/dev/mapper/vg0-root")
				(mount-point "/")
				(type "ext4")
				(needed-for-boot? #t)
				(dependencies mapped-devices))
			       (file-system
				(device "/dev/mapper/vg1-guix")
				(mount-point "/gnu")
				(type "xfs")
				(needed-for-boot? #t)
				(dependencies mapped-devices))
			       (file-system
				(device "/dev/mapper/vg1-nix")
				(mount-point "/nix")
				(type "xfs")
				(needed-for-boot? #f)
				(dependencies mapped-devices))
			       (file-system
				(device "/dev/mapper/vg0-tmp")
				(mount-point "/tmp")
				(type "ext4")
				(needed-for-boot? #t)
				(dependencies mapped-devices))
			       (file-system
				(device "/dev/mapper/vg1-var")
				(mount-point "/var")
				(type "ext4")
				(needed-for-boot? #t)
				(dependencies  mapped-devices))
			       (file-system
				(device "/dev/md124")
				(mount-point "/boot/efi")
				(type "vfat")
				(needed-for-boot? #t)
				(dependencies mapped-devices))
			       (file-system
				(device "/dev/mapper/vg0-opt")
				(mount-point "/opt")
				(type "ext4")
				(needed-for-boot? #f)
				(dependencies mapped-devices))
			       (file-system
				(device "/dev/mapper/vg2-home")
				(mount-point "/home")
				(type "xfs")
				(needed-for-boot? #f)
				(dependencies mapped-devices)))
			 %base-file-systems))

   (swap-devices (list (swap-space (target "/dev/mapper/vg1-swap")
				   (dependencies mapped-devices)
				   (discard? #t))))

   (users (cons (user-account
                 (name "kb")
                 (group "users")
                 (supplementary-groups '("input"
                                         "kvm"
                                         "netdev"
                                         "tty"
                                         "wheel")))
                %base-user-accounts))

   ;; This is where we specify system-wide packages.
   (packages (append %kbg-base-packages
                     %kbg-bare-desktop-packages
                     %base-packages))

   (services (append (list (service nix-service-type)
                           (service tlp-service-type
                                    (tlp-configuration
                                     (cpu-scaling-governor-on-ac (list "performance"))
                                     ;; (cpu-scaling-min-freq-on-ac  2400000)
                                     (cpu-boost-on-ac? #t)
                                     (energy-perf-policy-on-ac "performance")
                                     (pcie-aspm-on-ac "performance")))
                           (service openssh-service-type
                                    (openssh-configuration
                                     (x11-forwarding? #f)
                                     (password-authentication? #f)
                                     (permit-root-login 'prohibit-password)))
                           (nftables-service "owl")
                           (service munge-service-type)
                           (service slurm-service-type
                                    (slurm-configuration
                                     (SlurmdLogFile "/var/log/slurm/slurmd.log")
                                     (SlurmctldLogFile "/var/log/slurm/slurmctld.log")
                                     (ClusterName "owls")
                                     (SlurmUser "slurm")
                                     (SlurmctldHost '("localhost"))
                                     (DbdHost "localhost")
                                     (StorageType "accounting_storage/none")
                                     (slurm-extra-content
                                      (string-append
                                       "StateSaveLocation=/var/spool/slurmd/ctld #default /var/spool\n"
                                       "ReturnToService=1 #default 0\n"
                                       "DebugFlags=NO_CONF_HASH #default empty\n"
                                       "SelectType=select/cons_res #default select/linear\n"
                                       "SelectTypeParameters=CR_CPU #default 0\n"
                                       "# COMPUTE NODES\n"
                                       "NodeName=owl CPUs=1 Boards=1 SocketsPerBoard=1 CoresPerSocket=1 ThreadsPerCore=1\n"
                                       "PartitionName=debug Nodes=ALL Default=YES MaxTime=INFINITE State=UP"))
                                     (cgroup-extra-content
                                      (string-append
                                       "CgroupPlugin=cgroup/v1\n"
                                       "CgroupAutomount=yes #default no\n"
                                       "ConstrainCores=yes #default no\n"
                                       "IgnoreSystemd=yes #default no\n"
                                       "MaxRAMPercent=80  #default 100"))
                                     (slurmdbd-extra-content
                                      (string-append
                                       "LogFile=/var/log/slurm/slurmdbd.log #default none, syslog"))
                                     (run-slurmdbd? #f)
                                     (run-slurmctld? #t)))
                           (simple-service 'my-cron-jobs
                                           mcron-service-type
                                           (list mcron:guix-gc-repair-job)))
                     (modify-services %kbg-desktop-services
                                      (delete gdm-service-type))))

   ;; Allow resolution of '.local' host names with mDNS.
   (name-service-switch %mdns-host-lookup-nss)

   (setuid-programs %setuid-programs)))

owl-system
