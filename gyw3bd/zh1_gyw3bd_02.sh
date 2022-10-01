#!/bin/bash
# zh1 második feladat

RED='\033[1;31m'
BLUE='\033[0;34m'
GRAY='\033[1;30m'
NC='\033[0m'

if [[ $# -eq 1 ]]; then
    if [[ -d "$1" ]]; then
        echo -e "${BLUE}'$1'${NC}"
        find $1 -maxdepth 1 -type f -size +2048c -printf "%P:%s bytes\n"
        symCount=$(find $1 -maxdepth 1 -type l | wc -l)
        echo "Symlink counts: ${symCount}"
    else
        echo -e "${GRAY}'$1'${NC}"
    fi
elif [[ $# -eq 0 ]]; then
    echo -e "${RED}No parameter!${NC}"
else
    echo -e "${RED}Too much parameter!${NC}"
fi
