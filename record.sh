#!/usr/bin/bash

set -e
cd "$(dirname ${BASH_SOURCE[0]})"

export LANG=C
export LC_TIME=C
export S_TIME_FORMAT=ISO

mp_line=`mpstat -P ALL 5 1 | grep -v Average | grep all`
load=`echo "$mp_line" | awk '{print 100-$12}'`
t=`date "+%F:%H:%M:%S"`
mem=`free -m | head -n2 | tail -n1 | awk '{print $3}'`

echo "$t $load $mem" >> data
tail -n288 data > data.tmp

gnuplot plot.gp
mv stat.svg "$1"
