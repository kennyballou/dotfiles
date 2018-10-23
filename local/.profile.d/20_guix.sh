GUIX_PROFILE="${HOME}/.guix-profile"
GUIX_CURRENT="${HOME}/.config/guix/current"
GUIX_BIN="${GUIX_CURRENT}/bin"
PYTHONPATH="${GUIX_PROFILE}/lib/python3.6/site-packages${PYTHONPATH:+}"
C_INCLUDE_PATH="${GUIX_PROFILE}/include${C_INCLUDE_PATH:+}"
CPLUS_INCLUDE_PATH="${GUIX_PROFILE}/include${CPLUS_INCLUDE_PATH:+}"
LIBRARY_PATH="${GUIX_PROFILE}/lib${LIBRARY_PATH:+}"
export PATH="${GUIX_BIN}:${GUIX_PROFILE}/bin:${GUIX_PROFILE}/sbin${PATH:+:}${PATH}"
export SSL_CERT_DIR="${GUIX_PROFILE}/etc/ssl/certs"
export SSL_CERT_FILE="${GUIX_PROFILE}/etc/ssl/certs/ca-certificates.crt"
export GIT_SSL_CAINFO="${SSL_CERT_FILE}"
export GUIX_LOCPATH="${GUIX_PROFILE}/lib/locale"
export PYTHONPATH
export C_INCLUDE_PATH
export CPLUS_INCLUDE_PATH
export LIBRARY_PATH
