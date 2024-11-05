#!/bin/sh

#find-k8s-pods-lists

echo "                  "

kubectl get ns | awk 'NR > 1 {print $1}'
echo "                  "

echo "Enter your namespace from the above list or all"

read NS
if [ $NS = "all" ]; then

        NA=$(kubectl get ns | awk 'NR > 1 {print $1}')

        for z in $NA;
        do
  # Fetch pods specific to the namespace $z
          podid=$(kubectl get pods -n "$z" | awk 'NR > 1 { print $1 }')

          for i in $podid;
          do
    # Fetch the pod IP for each pod in namespace $z
            ipn=$(kubectl -n "$z" get pod "$i" -o jsonpath='{.status.podIP}')

            echo "Namespace: $z, Pod: $i, IP: $ipn"
          done
        done
else
        podid=$(kubectl get pods -n $NS | awk 'NR > 1 { print $1 }')

        for i in $podid;
        do
                ipn=$(kubectl -n $NS get pod $i -o jsonpath='{.status.podIP}')

        echo "$i : $ipn"

        done
fi
