#!/bin/bash

function get_color_back() {
  local color=$1
  if [[ color -eq 1 ]]; then
    echo "\033[97m"
  elif [[ color -eq 2 ]]; then
    echo "\033[91m"
  elif [[ color -eq 3 ]]; then
    echo "\033[92m"
  elif [[ color -eq 4 ]]; then
    echo "\033[94m"
  elif [[ color -eq 5 ]]; then
    echo "\033[95m"
  elif [[ color -eq 6 ]]; then
    echo "\033[30m"
  fi
}

function get_color_font() {
  local color=$1
  if [[ color -eq 1 ]]; then
    echo "\033[107m"
  elif [[ color -eq 2 ]]; then
    echo "\033[101m"
  elif [[ color -eq 3 ]]; then
    echo "\033[102m"
  elif [[ color -eq 4 ]]; then
    echo "\033[104m"
  elif [[ color -eq 5 ]]; then
    echo "\033[105m"
  elif [[ color -eq 6 ]]; then
    echo "\033[40m"
  fi
}
