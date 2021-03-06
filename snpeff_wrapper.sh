#!/bin/bash
set -e

finish() {
    # Fix ownership of output files
    uid=$(stat -c '%u:%g' /data)
    chown -R $uid /data
}
trap finish EXIT

# Call tool with parameters
java $JAVA_OPTS -Djava.io.tmpdir=/data/tmp -jar /opt/pimmuno/snpeff/snpEff.jar "$@"
