#!/bin/sh

packetdrill=/home/hannes/devel/packetdrill/gtests/net/packetdrill/packetdrill
timelimit=10s

timeout $timelimit $packetdrill $1 #> $1.out 2>&1
result=$?
if [ $result -eq 0 ] ; then
    rm $1.out
    printf "SUCCESS\n"
else
    printf "FAILED\n"
fi
