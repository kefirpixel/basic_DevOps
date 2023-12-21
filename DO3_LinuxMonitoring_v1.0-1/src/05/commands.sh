#!/bin/bash

. ./check.sh

folders_total=$(sudo find $1* 2>/dev/null -type d | wc -l)
top_folders=$(sudo du -h "$1"* | sort -hr | head -n 5 | awk '{print NR " - " $2 ", " $1}')
files_total=$(sudo find "$1" -type f | wc -l)
config_total=$(sudo find "$1" -type f -name "*.conf" | wc -l)
text_total=$(sudo find "$1" -type f -name "*.txt" | wc -l)
executable_total=$(sudo find "$1" -type f -executable | wc -l)
log_total=$(sudo find "$1" -type f -name "*.log" | wc -l)
archieve_total=$(sudo find "$1" -type f \( -name "*.zip" -o -name "*.7z" -o -name "*.tar" -o -name "*.rar" -o -name "*.gz" \) | wc -l)
sym_links_total=$(sudo find "$1" -type l | wc -l)
top10_largest_files=$(sudo find "$1" -type f -exec du -h {} + | sort -hr | sed -n '1,10'p | awk '{ext=""; file=$2; sub(".*/", "", file); if (index(file, ".") > 0) { n=split(file, arr, "."); ext=arr[n];} printf "%d - %s, %s%s\n", NR, $2, $1,(ext == "" ? "" : ", "ext)}')
top10_largest_exe_files=$(sudo find "$1" -type f -executable -exec du -h {} +| sed -n '1,10'p | head -n 10 | awk '{printf "%d - %s, %s, ", NR, $2, $1; system("md5sum " $2 " | cut -d\" \" -f1")}')
