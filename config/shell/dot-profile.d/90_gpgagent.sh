gpg-connect-agent /bye
SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
export SSH_AUTH_SOCK=${SSH_AUTH_SOCK}
