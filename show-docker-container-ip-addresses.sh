#GET docker container IP addresses

#!/bin/sh

var=($(docker ps -q))

for n in ${var[@]};

do

ip_address=$(docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' "$n")
container_name=$(docker inspect -f '{{.Name}}' "$n" | sed 's/\///g')

echo "$container_name : $ip_address";


done
