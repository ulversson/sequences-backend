#!/bin/bash
echo "Total arguments : $#"
echo "1st Argument = $1"
echo "2nd argument = $2"
DATE=`date "+%Y%m%d%M%S"`
touch /tmp/script_output/file-${DATE}.txt