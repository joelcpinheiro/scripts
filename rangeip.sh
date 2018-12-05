#!/bin/bash
for i in $(seq 1 244)
do
ping -c 1 -w 1 192.168.72.$i > /dev/null && echo 192.168.72.$i -UP || echo 192.168.72.$i -DOWN ;
done;
