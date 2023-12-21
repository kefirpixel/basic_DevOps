#!/bin/bash

if [[ $# -ne 0 ]]; then
  echo "Ошибка: этот скрипт не поддерживает параметры. Пожалуйста, попробуйте еще раз"
  exit 1
fi

chmod +x ./print.sh 
. ./print.sh 

exit 0