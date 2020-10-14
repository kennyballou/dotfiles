{  config, ... }:
let
  home-dir = config.home.homeDirectory;
in
{
  accounts.email.accounts.devnulllabs = {
    primary = true;
    address = "kballou@devnulllabs.io";
    maildir.path = "devnulllabs.io";
    imap = {
      host = "imap.fastmail.com";
      port = 993;
      tls = {
        enable = true;
        useStartTls = false;
      };
    };
    userName = "kballou@devnulllabs.io";
    passwordCommand = "gpg -q --for-your-eyes-only --no-tty --decrypt ~/.mail/kballou.devnulllabs.io.gpg";
    smtp = {
      host = "smtp.fastmail.com";
      port = 587;
      tls = {
        enable = true;
        useStartTls = true;
      };
    };
    msmtp = {
      enable = true;
      extraConfig = {
        logfile = "${home-dir}/.cache/msmtp/devnulllabs.io.log";
        syslog = "on";
      };
    };
    mu.enable = true;
    mbsync = {
      enable = true;
      create = "both";
      remove = "both";
      extraConfig = {
        account = {
          PipelineDepth = 1;
          Timeout = 60;
        };
        local = {
          Path =  "${home-dir}/.mail/devnulllabs.io/";
          Inbox = "${home-dir}/.mail/devnulllabs.io/INBOX";
        };
      };
      groups = {
        devnulllabs.channels = {
          inbox = {
            masterPattern = "Inbox";
            slavePattern = "INBOX";
          };
          sent = {
            masterPattern = "Sent";
            slavePattern = "sent";
          };
          archive = {
            masterPattern = "Archive";
            slavePattern = "archive";
          };
          trash = {
            masterPattern = "Trash";
            slavePattern = "trash";
          };
          spam = {
            masterPattern = "Spam";
            slavePattern = "spam";
          };
          lists = {
            masterPattern = "lists";
            slavePattern = "lists";
          };
        };
      };
    };
  };
}
