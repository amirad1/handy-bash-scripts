#!/bin/bash
#list open ports in linux server seperately and export to a csv file

netstat -tuln | awk '/^tcp/ {print $4}' | awk -F: '{print $NF}' | sort -n | uniq >> $HOSTNAME-ports.csv
