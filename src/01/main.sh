#!/bin/bash

pattern='^[+-]?[0-9]+([.][0-9]+)?$'

if [[ "$#" -ne 1 ]]
then
  echo "ILLEGAL PARAMETERS"
else
  if ! [[ $1 =~ $pattern ]]
  then
    echo $1
  else
    echo "ILLEGAL PARAMETERS"
  fi
fi