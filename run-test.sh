#!/bin/sh

packetdrill=/home/hannes/devel/packetdrill/gtests/net/packetdrill/packetdrill
timelimit=10s

echo "starting up dtrace"
sudo /home/hannes/devel/tcptest/run_dtrace.sh &
sleep 1

sudo timeout $timelimit $packetdrill $1 > $1.out 2>&1
result=$?
if [ $result -eq 0 ] ; then
    rm $1.out
    printf "SUCCESS\n"
else
    printf "FAILED\n"
fi

sleep 2
echo "hextotrace"
/home/hannes/devel/tcptest/hextotrace.native trace.out
echo $?
sudo rm trace.out
filename=$(echo $1 | cut -d '/' -f 3)
echo "moving to $filename.trace"
mv trace.out.tmp $filename.trace
echo "done with $?"
