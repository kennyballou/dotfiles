#!/usr/bin/env bash

docker() {
    case $@ in
        clean)
            ${HOME}/.local/bin/clean_docker
            ;;
        *)
            command docker "$@"
            ;;
    esac
}
