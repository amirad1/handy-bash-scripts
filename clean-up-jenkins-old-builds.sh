#!/bin/bash

#get jenkins home directory address
read JENKINS_ADDRESS

#default jenkins address
#JENKINS_ADDRESS='/var/lib/jenkins/jobs'

#clean up old jenkins builds except 5 latest builds and dev and master branch
find $JENKINS_ADDRESS -name "builds" -type d | grep -vE '/(master|dev)/builds$' | while read dir; do (cd "$dir" && ls -d */ | sort -n | head -n -5 | xargs rm -rf); done

#clean up old jenkins builds except 5 latest builds on all branches
find $JENKINS_ADDRESS -name "builds" -type d | while read dir; do (cd "$dir" && ls -d */ | sort -n | head -n -5 | xargs rm -rf); done
