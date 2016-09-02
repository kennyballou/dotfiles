#!/usr/bin/env bash

docker() {
    case $@ in
        clean)
            ${HOME}/.local/bin/clean_docker
            ;;
        reap-volumes)
            ${HOME}/.local/bin/reap_docker_volumes
            ;;
        *)
            command docker "$@"
            ;;
    esac
}
