#!/bin/sh

mount_crypt () {
    DEVICE=$1
    NAME=$2
    MOUNT=$3
    sudo cryptsetup luksOpen $DEVICE $NAME
    if [ $? -ne 0 ]; then
        exit 1
    fi
    sudo mount /dev/mapper/"$NAME" "$MOUNT"
    if [ $? -ne 0 ]; then
        exit 1
    fi
}
umount_crypt () {
    MOUNT=$1
    NAME=$2
    killall -u $USER -q gpg-agent
    sync
    sudo umount "$MOUNT"
    if [ $? -ne 0 ]; then
        exit 1
    fi
    sync
    sudo cryptsetup luksClose "$NAME"
    if [ $? -ne 0 ]; then
        exit 1
    fi
    sync
}

case "$1" in
    mount)
        mount_crypt $2 $3 $4;;
    umount)
        umount_crypt $2 $3;;
    *)
        exit 1;;
esac
