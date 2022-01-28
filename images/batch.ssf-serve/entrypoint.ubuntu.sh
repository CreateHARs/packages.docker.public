#!/bin/bash
set -eu

echo "whoami  : `whoami`"
echo "date    : `date`"
#echo "PROFILE : ${PROFILE}"
echo "CRONTAB_FILE_PATH : ${CRONTAB_FILE_PATH}"

#mkdir ./test
## Setup a cron schedule
#echo "
#* * * * * bash /workdir/scripts/ssf-scheduler-cli.sh cuckoo >/proc/1/fd/1 2>/proc/1/fd/2
##* * * * * echo 'test' >/proc/1/fd/1 2>/proc/1/fd/2
##* * * * * echo 'test' >> /var/log/cron.log 2>&1
## This extra line makes it a valid cron" \
#> ./test/scheduler.txt
#
#crontab ./test/scheduler.txt

crontab ${CRONTAB_FILE_PATH}
crontab -l

cron -f -l 2
