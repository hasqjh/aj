#!/bin/bash

user=user
password=password
ip=$1
prefix=192.128.
port=22
cmd=pwd

#export SSHPASS=${password}

realip=
flag=$(echo $ip | awk '/${prefix}|vlnx|VLNX/')
if [[ $flag = "" ]]; then
   realip=${prefix}${ip}
else
   realip=${ip}
fi

echo "ssh ${user}@${realip}"
sshpass -p ${password} ssh -o BatchMode=no -o StrictHostKeyChecking=no -l ${user} -p ${port} ${realip} -t "$cmd; bash --login"
