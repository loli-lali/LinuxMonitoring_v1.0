#!/bin/bash

source output.sh

function s21_write {
read -p "Do you want to record this data?[Y/N]" arg1
if [[ $arg1 == 'y' || $arg1 == 'Y' ]]
then
  CURRENT_DATE=`date +"%d_%m_%y_%H_%M_%S"`
  s21_output >> "$CURRENT_DATE.status"
else
  echo "It's all. See you soon"
  exit 1
fi
}