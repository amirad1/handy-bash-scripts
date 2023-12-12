#!/bin/bash

#write jenkins home directory address
JENKINS_ADDRESS=/var/lib/jenkins/jobs

#removes all the builds except the latest one and two other files called legacyIds permalinks
find $JENKINS_ADDRESS -name "build" -type d | while read dir; do (cd "$dir" && ls -d */ | sort -n | head -n -1 | xargs rm -rf); done
