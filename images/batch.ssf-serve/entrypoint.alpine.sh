#!/bin/bash
set -eu

echo "whoami            : `whoami`"
echo "date              : `date`"
echo "CRONTAB_FILE_PATH : ${CRONTAB_FILE_PATH}"

crontab ${CRONTAB_FILE_PATH}
echo "crontab -l"
crontab -l

crond -l 2 -f
