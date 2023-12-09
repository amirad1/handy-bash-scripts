#GET docker container IP addresses

#!/bin/sh

contid=($(docker ps -q))

for i in ${contid[@]}; do docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $i ;done
