#!/bin/bash

chmod +x ../02/commands.sh ../03/get_color.sh
source ../02/commands.sh
source ../03/get_color.sh

font1=$(get_color_font $1)
back1=$(get_color_back $2)
font2=$(get_color_font $3)
back2=$(get_color_back $4)

echo -e "${font1}${back1}HOSTNAME\e[0m = ${font2}${back2}$HOSTNAME\e[0m"
echo -e "${font1}${back1}TIMEZONE\e[0m = ${font2}${back2}$TIMEZONE_NAME UTC $TIMEZONE_OFFSET\e[0m"
echo -e "${font1}${back1}USER\e[0m = ${font2}${back2}$USER\e[0m"
echo -e "${font1}${back1}OS\e[0m = ${font2}${back2}$OS\e[0m"
echo -e "${font1}${back1}DATE\e[0m = ${font2}${back2}$DATE\e[0m"
echo -e "${font1}${back1}UPTIME\e[0m =${font2}${back2} $UPTIME\e[0m"
echo -e "${font1}${back1}UPTIME_SEC\e[0m = ${font2}${back2}$UPTIME_SEC\e[0m"
echo -e "${font1}${back1}IP\e[0m = ${font2}${back2}$IP\e[0m"
echo -e "${font1}${back1}MASK\e[0m = ${font2}${back2}$MASK\e[0m"
echo -e "${font1}${back1}GATEWAY\e[0m = ${font2}${back2}$GATEWAY\e[0m"
echo -e "${font1}${back1}RAM_TOTAL\e[0m = ${font2}${back2}$RAM_TOTAL\e[0m"
echo -e "${font1}${back1}RAM_USED\e[0m = ${font2}${back2}$RAM_USED\e[0m"
echo -e "${font1}${back1}RAM_USED\e[0m = ${font2}${back2}$RAM_FREE\e[0m"
echo -e "${font1}${back1}SPACE_ROOT\e[0m = ${font2}${back2}$SPACE_ROOT\e[0m"
echo -e "${font1}${back1}SPACE_ROOT_USED\e[0m = ${font2}${back2}$SPACE_ROOT_USED\e[0m"
echo -e "${font1}${back1}SPACE_ROOT_FREE\e[0m = ${font2}${back2}$SPACE_ROOT_FREE\e[0m"
