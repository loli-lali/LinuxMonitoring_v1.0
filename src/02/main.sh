#!/bin/bash

source output.sh
source write.sh

HOSTNAME=`hostname`
timedatectl set-timezone Europe/Moscow
TIMEZONE="`cat /etc/timezone` "UTC" `date "+%z"`"
USER=`whoami`
OS=`hostnamectl | grep 'Operating System' | cut -d ' ' -f '3 4 5'`
DATE=`date +"%d %B %Y %T"`
UPTIME=`uptime -p`
UPTIME_SEC=`cat /proc/uptime | cut -d ' ' -f1`
IP=`ip r | grep 'default via' | awk '{print $3}'`
MASK=`ifconfig | grep broadcast | awk '{print $4}'`
GATEWAY=`ip r l s global | awk '{print $3}'`
RAM_TOTAL=`free -m | grep Mem | awk '{ printf "%.3f GB\n", $2/1024 }'`
RAM_USED=`free -m | grep Mem | awk '{ printf "%.3f GB\n", $3/1024 }'`
RAM_FREE=`free -m | grep Mem | awk '{ printf "%.3f GB\n", $4/1024 }'`
SPACE_ROOT=`df /root/ | grep dev | awk '{printf "%.2f\n", $2/1024}'`
SPACE_ROOT_USED=`df /root/ | grep dev | awk '{printf "%.2f\n", $3/1024}'`
SPACE_ROOT_FREE=`df /root/ | grep dev | awk '{printf "%.2f\n", $4/1024}'`

s21_output
s21_write
