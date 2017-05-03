#!/usr/bin/env bash

#   gen_sshconfig.sh -- Simple script to combine ssh configs
#   Copyright (C) 2017 Kenny Ballou

#   This program is free software: you can redistribute it and/or modify
#   it under the terms of the GNU General Public License as published by
#   the Free Software Foundation, either version 3 of the License, or
#   (at your option) any later version.

#   This program is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.

#   You should have received a copy of the GNU General Public License
#   along with this program.  If not, see <http://www.gnu.org/licenses/>.

SSH_CONFIG_DIR=${HOME}/.ssh
SSH_CONFIG=${SSH_CONFIG_DIR}/config
SSH_CONFIGS_DIR=${SSH_CONFIG_DIR}/config.d

mv ${SSH_CONFIG} ${SSH_CONFIG}-`date -Iseconds`.old

cat << EOF > ${SSH_CONFIG}
# vim: filetype=sshconfig:
# DO NOT EDIT THIS FILE!
# This file is automatically generated via "gen_sshconfig.sh".
# Edits will be lost the next time "gen_sshconfig.sh" is used.
EOF

cat ${SSH_CONFIGS_DIR}/*.conf | grep --invert-match '^#' >> ${SSH_CONFIG}
