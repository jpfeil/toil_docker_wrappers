#!/bin/bash
set -e
args=( "$@" )

finish() {
    # Fix ownership of output files
    uid=$(stat -c '%u:%g' /data)
    chown -R $uid /data
}
trap finish EXIT

# Call tool with parameters
/usr/bin/python /home/rankboost/rankboost.py "${args[@]:1}"