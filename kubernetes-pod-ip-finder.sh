#!/bin/sh
#find-k8s-pods-lists

echo "                  "

kubectl get ns | awk 'NR > 1 {print $1}'
echo "                  "

echo "Enter your namespace from the above list:"

read NS

podid=$(kubectl get pods -n $NS | awk 'NR > 1 { print $1 }')

for i in $podid;
do
        ipn=$(kubectl -n $NS get pod $i -o jsonpath='{.status.podIP}')

echo "$i : $ipn"

done
