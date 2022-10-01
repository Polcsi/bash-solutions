#!/bin/bash
# zh1 második feladat

RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m'
LG='\033[1;32m'

if [[ $# -eq 1 ]]; then
    if [[ -d "$1" ]]; then
        echo -e "${YELLOW}'$1'${NC}"
        find $1 -maxdepth 1 -type f -size -2048c -printf "%P,%s bytes\n"
        count=$(find $1 -maxdepth 1 -not -name ".*" | wc -l)
        echo -e "${LG}Bejegyzések száma: ${count}${NC}"
    else
        echo -e "${RED}'$1'${NC}"
    fi
elif [[ $# -eq 0 ]]; then
    echo -e "${RED}No parameter given!${NC}"
else
    echo -e "${RED}Too much parameter given!${NC}"
fi
