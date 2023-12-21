#!/bin/bash

if [[ ! -f ./colors.conf ]]; then 
echo "Файл конфигурации не существует"
exit 1 
fi

#считать значения из файла конфигурации, дефолтные цвета
colm1_bg=$(grep "column1_background=" colors.conf | cut -d "=" -f 2)
if [[ -z "$colm1_bg" ]]; then 
colm1_bg=6
fi

colm1_fn=$(grep "column1_font_color=" colors.conf | cut -d "=" -f 2)
if [[ -z "$colm1_fn" ]]; then 
colm1_fn=1
fi

colm2_bg=$(grep "column2_background=" colors.conf | cut -d "=" -f 2)
if [[ -z "$colm2_bg" ]]; then 
colm2_bg=2
fi

colm2_fn=$(grep "column2_font_color=" colors.conf | cut -d "=" -f 2)
if [[ -z "$colm2_fn" ]]; then 
colm2_fn=4
fi

if [ "$colm1_bg" = "$colm1_fn" ] || [ "$colm2_bg" = "$colm2_fn" ]; then
    echo "Error: font and background colors are identical. Please, try again."
    exit 1
fi


chmod +x ../03/print.sh
. ../03/print.sh ${colm1_bg} ${colm1_fn} ${colm2_bg} ${colm2_bg}