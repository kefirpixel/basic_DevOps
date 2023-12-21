#!/bin/bash

chmod +x print.sh check.sh

. ./check.sh "$@"
. ./print.sh ${1} ${2} ${3} ${4}

exit 0