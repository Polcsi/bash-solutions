#!/bin/bash

GRAY='\e[37m'
CYAN='\e[36m'
NC='\e[0m'

if [ $# -ne 1 ]; then
    echo "Scriptet csak egy paraméterel lehet használni, ami egy könyvtár!"
else
    if [ -d "$1" ]; then
        echo -e "${CYAN}$1${NC}"
        find $1 -maxdepth 1 -type f -size +4096c -printf "%P:%M\n"
        find $1 -maxdepth 1 -type f | wc -l
    else
        echo -e "${GRAY}$1${NC}"
    fi
fi
