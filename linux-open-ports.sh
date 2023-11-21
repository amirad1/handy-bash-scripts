#!/bin/bash
#find open ports and export to a csv file

netstat -tuln | awk '/^tcp/ {print $4}' | awk -F: '{print $NF}' | sort -n | uniq >> $HOSTNAME-ports.csv
