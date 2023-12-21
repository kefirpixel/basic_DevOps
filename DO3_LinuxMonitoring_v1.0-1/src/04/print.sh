#!/bin/bash

chmod +x get_color_c.sh
. ./get_color_c.sh

echo ""
color_name=("white" "red" "green" "blue" "purple" "black")

if [ "$colm1_bg" = 6 ]; then
echo "Column 1 background = default (${color_name[$colm1_bg - 1]})"
else
echo "Column 1 background = $colm1_bg (${color_name[$colm1_bg - 1]})"
fi

if [ "$colm1_fn" = 1 ]; then 
echo "Column 1 font color = default (${color_name[$colm1_fn - 1]})"
else 
echo "Column 1 font color = $colm1_fn (${color_name[$colm1_fn - 1]})"
fi 

if [ "$colm2_bg" = 2 ]; then 
echo "Column 2 background = default (${color_name[$colm2_bg - 1]})"
else 
echo "Column 2 background = $colm2_bg (${color_name[$colm2_bg - 1]})"
fi 

if [ "$colm2_fn" = 4 ]; then 
echo "Column 2 font color = default (${color_name[$colm2_fn - 1]})"
else 
echo "Column 2 font color = $colm2_fn (${color_name[$colm2_fn - 1]})"
fi