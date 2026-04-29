#!/bin/sh
# ABOUTME: Sends IPC commands to the Noctalia shell instance.
exec qs -c noctalia-shell ipc call "$@"
