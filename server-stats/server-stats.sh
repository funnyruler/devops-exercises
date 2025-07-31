#!/bin/bash

CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}')
TOTAL_MEMORY=$(free -h | grep Mem: | awk '{print $2}')
USED_MEMORY=$(free -h | grep Mem: | awk '{print $3}')
FREE_MEMORY=$(free -h | grep Mem: | awk '{print $4}')
USED_MEMORY_PERCENTAGE=$(free -m | grep Mem: | awk '{print ($3/$2)*100}')
FREE_MEMORY_PERCENTAGE=$(free -m | grep Mem: | awk '{print ($4/$2)*100}')
TOTAL_DISK_SPACE=$(df -h --total | grep total | awk '{print $2}')
USED_DISK_SPACE=$(df -h --total | grep total | awk '{print $3}')
FREE_DISK_SPACE=$(df -h --total | grep total | awk '{print $4}')
USED_DISK_PERCENTAGE=$(df -h --total | grep total | awk '{print $5}')
TOP_MEMORY_USAGE_PROCESS=$(top -bn1 | tail -n +8 | sort -rn -k10 | head -5 | awk '{print $12,$10}' | sed 's/$/%/')
TOP_CPU_USAGE_PROCESS=$(top -bn1 | tail -n +8 | sort -rn -k9 | head -5 | awk '{print $12,$9}' | sed 's/$/%/')
echo -e "CPU Usage: $CPU_USAGE%
Total memory: $TOTAL_MEMORY
Used memory: $USED_MEMORY
Free memory: $FREE_MEMORY
Total memory usage: $USED_MEMORY_PERCENTAGE%
Free memory percentage: $FREE_MEMORY_PERCENTAGE%\n
Total disk space: $TOTAL_DISK_SPACE
Used disk space: $USED_DISK_SPACE
Free disk space: $FREE_DISK_SPACE
Total disk space usage: $USED_DISK_PERCENTAGE%\n\n
Top memory usage processes list:\n$TOP_MEMORY_USAGE_PROCESS\n
Top CPU usage processes list:\n$TOP_CPU_USAGE_PROCESS"