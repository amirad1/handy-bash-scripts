#start point
port=1
ip=<'your-ip'>

echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Port Crawler Started <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<"

until [ $port -eq 65536 ]
do
    nc -zv $ip $port -w 1
    if [ $? -eq 0 ];
then 
    echo "$port is open" && >> ports-status.txt 
fi
    port=`expr $port + 1`
done

