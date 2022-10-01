#!/bin/bash
# zh1 második feladat

PURPLE='\033[0;35m'
GRAY='\033[1;30m'
RED='\033[1;31m'
NC='\033[0m'
CYAN='\033[1;36m'

if [[ $# -eq 1 ]]; then
    if [[ -d "$1" ]]; then
        echo -e "${PURPLE}'$1'${NC}"
        find $1 -maxdepth 1 -type f -size +6144c -printf "%P\t%M\t%s bytes\n"
        hiddenDirCount=$(find $1 -maxdepth 1 -type d -name ".*" | wc -l)
        echo -e "${CYAN}Hidden directories count: $hiddenDirCount${NC}"
    else
        echo -e "${GRAY}'$1'${NC}"
    fi
elif [[ $# -eq 0 ]]; then
    echo -e "${RED}Enter at least one parameter!${NC}"
else
    echo -e "${RED}Too much parameter!${NC}"
fi
