#!/bin/bash
service=vpnc

if (( $(ps -ef | grep $service | wc -l) > 0 ))
then
echo "Stopping $service.."
$service-disconnect
sleep 1
(( $(ps axf | grep $service | awk '{print $1}' | xargs kill -9)))
fi
if
(( $(ps -ef | grep -v grep | grep $service | wc -l) < 1 ))
then
echo "$Service stopped."
else
echo "Failed to stop $service!"
fi
