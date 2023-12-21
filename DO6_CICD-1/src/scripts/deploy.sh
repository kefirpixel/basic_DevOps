#!/bin/bash

cat_path=./../C3_SimpleBashUtils-0/src/cat/s21_cat
grep_path=./../C3_SimpleBashUtils-0/src/grep/s21_grep

scp $cat_path $grep_path keren@10.10.0.2:/usr/local/bin/
ssh keren@10.10.0.2 ls /usr/local/bin/