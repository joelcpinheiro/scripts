#!/bin/bash
memlivre=$(cat /proc/meminfo | grep MemFree | tr -s ' ' | cut -d ' ' -f2) && memlivre=$(echo "$memlivre/1024.0" | bc)
memcached=$(cat /proc/meminfo | grep "^Cached" | tr -s ' ' | cut -d ' ' -f2) && memcached=$(echo "$memcached/1024.0" | bc)

limite=`echo 1096`
data=`date "+%d/%m/%Y, as %H:%M:%S"`

if [ "$memlivre" -lt "$limite" ]
  then
   sync && echo 3 > /proc/sys/vm/drop_caches
  else
   echo  "nao foi necessario limpar o cache, dia  $data" >> zerocached_logs.txt
  fi 
exit 0
