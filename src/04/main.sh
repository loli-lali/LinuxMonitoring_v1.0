#!/bin/bash

source config.conf
source output.sh
source color.sh

pattern='^[1-6]$'


if [[ -z $column1_background || $column1_background =~ $pattern ]] && 
   [[ -z $column1_font_color || $column1_font_color =~ $pattern ]] &&
   [[ -z $column2_background || $column2_background =~ $pattern ]] &&
   [[ -z $column2_font_color || $column2_font_color =~ $pattern ]]
then
    if [[ -n $column1_background && -n $column1_font_color && $column1_background -eq $column1_font_color ]] || 
       [[ -n $column2_background && -n $column2_font_color && $column2_background -eq $column2_font_color ]]
    then 
      echo "ILLEGAL PARAMETERS: parameter 1 should not be equal to parameter 2 and parameter 3 should not be equal to parameter 4"
      echo "Try again"
      exit 1
    else
      HOSTNAME=`hostname`
      timedatectl set-timezone Europe/Moscow
      TIMEZONE="`cat /etc/timezone` "UTC" `date "+%z"`"
      USER=`whoami`
      OS=`hostnamectl | grep 'Operating System' | cut -d ' ' -f '3 4 5'`
      DATE=`date +"%d %B %Y %T"`
      UPTIME=`uptime -p`
      UPTIME_SEC=`cat /proc/uptime | cut -d ' ' -f1`
      IP=`ip a | grep 'dynamic enp0s3' | awk '{print $2}'`
      MASK=`ifconfig | grep broadcast | awk '{print $4}'`
      GATEWAY=`ip r l s global | awk '{print $3}'`
      RAM_TOTAL=`free -m | grep Mem | awk '{ printf "%.3f GB\n", $2/1024 }'`
      RAM_USED=`free -m | grep Mem | awk '{ printf "%.3f GB\n", $3/1024 }'`
      RAM_FREE=`free -m | grep Mem | awk '{ printf "%.3f GB\n", $4/1024 }'`
      SPACE_ROOT=`df /root/ | grep dev | awk '{printf "%.2f\n", $2/1024}'`
      SPACE_ROOT_USED=`df /root/ | grep dev | awk '{printf "%.2f\n", $3/1024}'`
      SPACE_ROOT_FREE=`df /root/ | grep dev | awk '{printf "%.2f\n", $4/1024}'`
      s21_set_color
      s21_output
      s21_output_color
    fi
else
  echo "ILLEGAL PARAMETERS: enter numbers from 1 to 6"
fi
