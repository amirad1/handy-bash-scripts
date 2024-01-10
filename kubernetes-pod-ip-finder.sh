#!/bin/sh
#find-k8s-pods-lists

podid=$(kubectl get pods -n dev | awk '{print $1}')

for i in $podid;
do
kubectl exec --tty --stdin -n dev $i ip address | grep 'inet 10' | awk '{print $2}' >> pods-ip-list.txt
echo $i >> pods-ip-list.txt;
done
