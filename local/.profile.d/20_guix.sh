GUIX_PROFILE="${HOME}/.guix-profile"
export PATH="${GUIX_PROFILE}/bin:${GUIX_PROFILE}/sbin${PATH:+:}${PATH}"
export SSL_CERT_DIR="${GUIX_PROFILE}/etc/ssl/certs"
export SSL_CERT_FILE="${GUIX_PROFILE}/etc/ssl/certs/ca-certificates.crt"
export GIT_SSL_CAINFO="${SSL_CERT_FILE}"
export GUIX_LOCPATH="${GUIX_PROFILE}/lib/locale"
