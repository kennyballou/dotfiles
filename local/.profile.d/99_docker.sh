#!/usr/bin/env bash

docker() {
    case $1 in
        clean)
            ${HOME}/.local/bin/clean_docker
            ;;
        reap-volumes)
            ${HOME}/.local/bin/reap_docker_volumes
            ;;
        tags)
            shift
            ${HOME}/.local/bin/docker-tags $@
            ;;
        *)
            command docker "$@"
            ;;
    esac
}
