#!/usr/bin/bash

set -e
cd "$(dirname ${BASH_SOURCE[0]})"

export LANG=C

load=`mpstat -P ALL 5 1 | grep -v Average | grep all | awk '{print 100-$13}'`
t=`date "+%F:%H:%M:%S"`
mem=`free -m | head -n2 | tail -n1 | awk '{print $3}'`

echo "$t $load $mem" >> data
tail -n288 data > data.tmp

gnuplot plot.gp
mv stat.svg "$1"
