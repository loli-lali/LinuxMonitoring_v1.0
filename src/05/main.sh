#!/bin/bash

source output.sh

START=`date +%s`

if [[ -z $1 ]]
then 
  echo "ILLEGAL PARAMETERS: enter the path to the directory"
else
  if [[ ${1:(-1)} == '/' ]]
  then
    if [[ -d $1 ]]
    then
      TOTAL_NUMBER_FOLDERS=`find $1 -type d  2>/dev/null | wc -l`
      TOTAL_NUMBER_FILES=`find $1 -type f  2>/dev/null | wc -l`
      CONF_FILES=`find $1 -type f  2>/dev/null |grep .conf | wc -l`
      TEXT_FILES=`find $1 -type f  2>/dev/null |grep .txt | wc -l`
      EXEC_FILES=`find $1 -type f -perm /a=x  2>/dev/null | wc -l`
      LOG_FILES=`find $1 -type f  2>/dev/null | grep .log | wc -l`
      ARC_FILES=`find $1 -type f  2>/dev/null | grep -e '*.tar' -e '*.zip' -e '*.jar' -e '*.7z' -e '*.gz' -e '*.xar' | wc -l`
      SLINCS=`find $1 -type l  2>/dev/null | wc -l`

      s21_output $1
      s21_find_file $1

      END=`date +%s`
      DIFF=$(( $END - $START ))
      s21_time
    else
      echo "ILLEGAL PARAMETERS: not directory"
    fi
  else
    echo "ILLEGAL PARAMETERS: the parameter must end with '/'"
  fi

fi