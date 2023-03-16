#!/bin/bash

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
  s21_find_back_color $1
  HEAD_BACK_COLOR="\033[$?m"

  s21_find_text_color $2
  HEAD_COLOR="\033[$?m"

  s21_find_back_color $3
  TEXT_BACK_COLOR="\033[$?m"

  s21_find_text_color $4
  TEXT_COLOR="\033[$?m"

  ENDCOLOR="\033[0m"
}
