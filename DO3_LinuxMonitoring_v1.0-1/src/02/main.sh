#!/bin/bash

if [ $# -ne 0 ]; then
    echo "Ошибка: Необходимо передать 0 параметров"
    exit 1
fi

chmod +x commands.sh
chmod +x print.sh
. ./commands.sh
. ./print.sh


read -p "Хотите сохранить информацию в файл (Y/N)? " answer
if [[ $answer =~ ^[Yy]$ ]]; 
then 
. ./print.sh > $(date | awk '{printf "%d_%s_%d_%s", $2, $3, $4, $5}').status
else
    echo "Информация не была сохранена в файл."
fi