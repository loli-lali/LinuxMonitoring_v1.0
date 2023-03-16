#!/bin/bash


function s21_output {
  echo -e "Total number of folders (including all nested ones) = $TOTAL_NUMBER_FOLDERS"
  echo -e "TOP 5 folders of maximum size arranged in descending order (path and size):"
  find $1 -type d -exec du -h {} +  2>/dev/null | sort -hr | head -5 | awk 'BEGIN { i = 1 }{ printf "%d - %s, %s\n", i, $2, $1; ++i }'
  echo -e "Total number of files = $TOTAL_NUMBER_FILES"
  echo -e "Number of:"
  echo -e "Configuration files (with the .conf extension) = $CONF_FILES"
  echo -e "Text files = $TEXT_FILES"
  echo -e "Executable files = $EXEC_FILES"
  echo -e "Log files (with the extension .log) = $LOG_FILES"
  echo -e "Archive files = $ARC_FILES"
  echo -e "Symbolic links = $SLINCS"
}

function s21_find_file {
  echo -e "TOP 10 files of maximum size arranged in descending order (path, size and type):"  
  LIST=`find $1 -type f -exec du -h {} +  2>/dev/null | sort -hr | head -10 | awk '{ printf "%s|%s\n", $2, $1} '`
  COUNT=1

  for var in $LIST
  do 
  if [[ -n $var ]]
  then
    echo -n "$COUNT - "
    TEMP=`echo $var | cut -d '|' -f1`
    echo -n "$TEMP, "
    SIZE=`echo $var | cut -d '|' -f2`
    echo -n "$SIZE, "
    TYPE=`echo $var | cut -d '|' -f1 | awk -F '.' '{ print $NF }'`
    echo $TYPE

    COUNT=$(( $COUNT + 1 ))
  fi
  done
  echo -e "TOP 10 executable files of the maximum size arranged in descending order (path, size and MD5 hash of file):"
  LIST_2=`find $1 -type f -perm /a=x -exec du -h {} +  2>/dev/null | sort -hr | head -10 | awk '{ printf "%s|%s\n", $2, $1}'`
  COUNT_2=1

  for var in $LIST_2
  do
  if [[ -n $var ]]
  then
    echo -n "$COUNT_2 - "
    TEMP=`echo $var | cut -d '|' -f1`
    echo -n "$TEMP, "
    SIZE=`echo $var | cut -d '|' -f2`
    echo -n "$SIZE, "
    HASH=`md5sum $TEMP | awk '{  print $1 }'`
    echo $HASH

    COUNT_2=$(( $COUNT_2 + 1 ))
  fi
  done
}

function s21_time {
  echo -e "Script execution time (in seconds) = $DIFF"
}
