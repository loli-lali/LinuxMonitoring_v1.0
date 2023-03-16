#!/bin/bash

source config.conf

column_1_background_default=1
column_1_text_default=6
column_2_background_default=2
column_2_text_default=4

name_color=""


function s21_find_text_color {
  RESULT=0

  case "$1" in
    1) RESULT=37 
    ;;
    2) RESULT=31 
    ;;
    3) RESULT=32 
    ;;
    4) RESULT=34 
    ;;
    5) RESULT=35 
    ;;
    6) RESULT=30
    ;;
  esac

  return $RESULT
}

function s21_find_back_color {
  RESULT=0
  case "$1" in
    1) RESULT=47
    ;;
    2) RESULT=41
    ;;
    3) RESULT=42 
    ;;
    4) RESULT=44 
    ;;
    5) RESULT=45 
    ;;
    6) RESULT=40 
    ;;
  esac
  return $RESULT
}

function s21_set_color {
  if [[ -z $column1_background ]]
  then
    s21_find_back_color $column_1_background_default
    HEAD_BACK_COLOR="\033[$?m"
  else
    s21_find_back_color $column1_background
    HEAD_BACK_COLOR="\033[$?m"
  fi 

  if [[ -z $column1_font_color ]]
  then
    s21_find_text_color $column_1_text_default
    HEAD_COLOR="\033[$?m"
  else
    s21_find_text_color $column1_font_color
    HEAD_COLOR="\033[$?m"
  fi 

  if [[ -z $column2_background ]]
  then
    s21_find_back_color $column_2_background_default
    TEXT_BACK_COLOR="\033[$?m"
  else
    s21_find_back_color $column2_background
    TEXT_BACK_COLOR="\033[$?m"
  fi 

  if [[ -z $column2_font_color ]]
  then
    s21_find_text_color $column_2_text_default
    TEXT_COLOR="\033[$?m"
  else
    s21_find_text_color $column2_font_color
    TEXT_COLOR="\033[$?m"
  fi 

  ENDCOLOR="\033[0m"
}
