#!/bin/bash

function s21_output {
  echo -e "${HEAD_BACK_COLOR}${HEAD_COLOR}HOSTNAME${ENDCOLOR} = ${TEXT_BACK_COLOR}${TEXT_COLOR}$HOSTNAME${ENDCOLOR}" 
  echo -e "${HEAD_BACK_COLOR}${HEAD_COLOR}TIMEZONE${ENDCOLOR} = ${TEXT_BACK_COLOR}${TEXT_COLOR}$TIMEZONE${ENDCOLOR}"
  echo -e "${HEAD_BACK_COLOR}${HEAD_COLOR}USER${ENDCOLOR}  = ${TEXT_BACK_COLOR}${TEXT_COLOR}$USER${ENDCOLOR}"
  echo -e "${HEAD_BACK_COLOR}${HEAD_COLOR}OS${ENDCOLOR}  = ${TEXT_BACK_COLOR}${TEXT_COLOR}$OS${ENDCOLOR}"
  echo -e "${HEAD_BACK_COLOR}${HEAD_COLOR}DATE${ENDCOLOR}  = ${TEXT_BACK_COLOR}${TEXT_COLOR}$DATE${ENDCOLOR}" 
  echo -e "${HEAD_BACK_COLOR}${HEAD_COLOR}UPTIME${ENDCOLOR}  = ${TEXT_BACK_COLOR}${TEXT_COLOR}$UPTIME${ENDCOLOR}" 
  echo -e "${HEAD_BACK_COLOR}${HEAD_COLOR}UPTIME_SEC${ENDCOLOR}  = ${TEXT_BACK_COLOR}${TEXT_COLOR}$UPTIME_SEC${ENDCOLOR}" 
  echo -e "${HEAD_BACK_COLOR}${HEAD_COLOR}IP${ENDCOLOR}  = ${TEXT_BACK_COLOR}${TEXT_COLOR}$IP${ENDCOLOR}"
  echo -e "${HEAD_BACK_COLOR}${HEAD_COLOR}MASK${ENDCOLOR}  = ${TEXT_BACK_COLOR}${TEXT_COLOR}$MASK${ENDCOLOR}" 
  echo -e "${HEAD_BACK_COLOR}${HEAD_COLOR}GATEWAY${ENDCOLOR}  = ${TEXT_BACK_COLOR}${TEXT_COLOR}$GATEWAY${ENDCOLOR}" 
  echo -e "${HEAD_BACK_COLOR}${HEAD_COLOR}RAM_TOTAL${ENDCOLOR}  = ${TEXT_BACK_COLOR}${TEXT_COLOR}$RAM_TOTAL${ENDCOLOR}" 
  echo -e "${HEAD_BACK_COLOR}${HEAD_COLOR}RAM_USED${ENDCOLOR}  = ${TEXT_BACK_COLOR}${TEXT_COLOR}$RAM_USED${ENDCOLOR}"
  echo -e "${HEAD_BACK_COLOR}${HEAD_COLOR}RAM_FREE${ENDCOLOR}  = ${TEXT_BACK_COLOR}${TEXT_COLOR}$RAM_FREE${ENDCOLOR}"
  echo -e "${HEAD_BACK_COLOR}${HEAD_COLOR}SPACE_ROOT${ENDCOLOR}  = ${TEXT_BACK_COLOR}${TEXT_COLOR}$SPACE_ROOT${ENDCOLOR}" 
  echo -e "${HEAD_BACK_COLOR}${HEAD_COLOR}SPACE_ROOT_USED${ENDCOLOR} = ${TEXT_BACK_COLOR}${TEXT_COLOR}$SPACE_ROOT_USED${ENDCOLOR}" 
  echo -e "${HEAD_BACK_COLOR}${HEAD_COLOR}SPACE_ROOT_FREE${ENDCOLOR} = ${TEXT_BACK_COLOR}${TEXT_COLOR}$SPACE_ROOT_FREE${ENDCOLOR}"
  echo -e
}


function s21_find_name {
  case $1 in
  1) name_color="(white)"
  ;;
  2) name_color="(red)"
  ;;
  3) name_color="(green)"
  ;; 
  4) name_color="(blue)"
  ;; 
  5) name_color="(purple)"
  ;; 
  6) name_color="(black)"
  ;;
  esac
}


function s21_output_color {
  if [[ -z $column1_background ]]
  then
   s21_find_name $column_1_background_default
   echo "Column 1 background = default $name_color"
  else
  s21_find_name $column1_background
   echo "Column 1 background = $column1_background $name_color"
  fi

  if [[ -z $column1_font_color ]]
  then
    s21_find_name $column_1_text_default
    echo "Column 1 font color = default $name_color"
  else
    s21_find_name $column1_font_color
    echo "Column 1 font color = $column1_font_color $name_color"
  fi

  if [[ -z $column2_background ]]
  then
    s21_find_name $column_2_background_default
    echo "Column 2 background = default $name_color"
  else
    s21_find_name $column2_background
    echo "Column 2 background = $column2_background $name_color"
  fi

  if [[ -z $column2_font_color ]]
  then
    s21_find_name $olumn_2_text_default
    echo "Column 2 font color = default $name_color"
  else
    s21_find_name $column2_font_color
    echo "Column 2 font color = $column2_font_color $name_color"
  fi
}