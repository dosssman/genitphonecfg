#!/bin/bash

REVERSE_SHELL_PORT=$(cat ./m/DEFAULT_PORT)
REMOTE_HOSTNAME=$(cat ./REMOTE_HOSTNAME)

pkill -f "ssh -L ${REVERSE_SHELL_PORT}:127.0.0.1:${REVERSE_SHELL_PORT} root@${REMOTE_HOSTNAME} -fNT"

ssh -L ${REVERSE_SHELL_PORT}:127.0.0.1:${REVERSE_SHELL_PORT} root@${REMOTE_HOSTNAME} -fNT
