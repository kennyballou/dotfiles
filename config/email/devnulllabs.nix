{  config, ... }:
let
  home-dir = config.home.homeDirectory;
in
{
  accounts.email.accounts.devnulllabs = {
    primary = true;
    address = "kb@devnulllabs.io";
    maildir.path = "devnulllabs.io";
    imap = {
      host = "imap.gmail.com";
      port = 993;
      tls = {
        enable = true;
        useStartTls = false;
      };
    };
    userName = "kb@devnulllabs.io";
    passwordCommand = "gpg -q --for-your-eyes-only --no-tty --decrypt ~/.mail/kb.devnulllabs.io.gpg";
    smtp = {
      host = "smtp.gmail.com";
      port = 587;
      tls = {
        enable = true;
        useStartTls = true;
      };
    };
    folders = {
      drafts = "drafts";
      inbox = "INBOX";
      sent = "sent";
      trash = "trash";
    };
    msmtp = {
      enable = true;
      extraConfig = {
        logfile = "${home-dir}/.cache/msmtp/devnulllabs.io.log";
        syslog = "on";
      };
    };
    mu.enable = false;
    mbsync = {
      enable = false;
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
            farPattern = "INBOX";
            nearPattern = "INBOX";
          };
          sent = {
            farPattern = "Sent";
            nearPattern = "sent";
          };
          archive = {
            farPattern = "Archive";
            nearPattern = "archive";
          };
          trash = {
            farPattern = "Trash";
            nearPattern = "trash";
          };
          spam = {
            farPattern = "Spam";
            nearPattern = "spam";
          };
          lists = {
            farPattern = "lists";
            nearPattern = "lists";
          };
        };
      };
    };
  };
}
