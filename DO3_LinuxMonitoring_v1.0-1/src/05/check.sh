#!/bin/bash

if [[ $# -ne 1 ]]; then
  echo "Ошибка: эта поддержка скрипта должна содержать 1 параметр. Пожалуйста, попробуйте еще раз"
  exit 1
fi

if [[ $1 != */ ]]; then
  echo "Ошибка: параметр должен заканчиваться символом '/'"
  exit 1
fi

if [ ! -d "$1" ]; then
    echo "Ошибка: каталог не существует"
    exit 1
fi