{ pkgs, config, ... }:
let
  home-dir = config.home.homeDirectory;
in
{
  accounts.email.accounts.uboisestate = {
    address = "kennyballou@u.boisestate.edu";
    maildir.path = "u.boisestate.edu";
    imap = {
      host = "imap.gmail.com";
      port = 993;
      tls = {
        enable = true;
        useStartTls = false;
      };
    };
    userName = "kennyballou@u.boisestate.edu";
    passwordCommand = "gpg -q --for-your-eyes-only --no-tty --decrypt ~/.mail/kennyballou.u.boisestate.edu.gpg";
    smtp = {
      host = "smtp.gmail.com";
      port = 587;
      tls = {
        enable = true;
        useStartTls = true;
      };
    };
    msmtp = {
      enable = true;
      extraConfig = {
        logfile = "${home-dir}/.cache/msmtp/boisestate.log";
        syslog  = "on";
      };
    };
    mu.enable = false;
    mbsync = {
      enable = false;
      create = "both";
      remove = "both";
      extraConfig = {
        account = {
          PipelineDepth = 2;
          Timeout = 60;
        };
        local = {
          Path =  "${home-dir}/.mail/u.boisestate.edu/";
          Inbox = "${home-dir}/.mail/u.boisestate.edu/INBOX";
        };
      };
      groups = {
        uboisestate.channels = {
          inbox = {
            farPattern = "INBOX";
            nearPattern = "INBOX";
          };
          sent = {
            farPattern = "[Gmail]/Sent Mail";
            nearPattern = "sent";
          };
          archive = {
            farPattern = "[Gmail]/All Mail";
            nearPattern = "archive";
          };
          trash = {
            farPattern = "[Gmail]/Trash";
            nearPattern = "trash";
          };
          spam = {
            farPattern = "[Gmail]/Spam";
            nearPattern = "spam";
          };
        };
      };
    };
  };
}
