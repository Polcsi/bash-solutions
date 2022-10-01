#!/bin/bash
# zh1 második feladat 'mslznt'
# colors
RED='\033[0;31m'
BLUE='\033[0;34m'
NC='\033[0m'
CYAN='\033[1;36m'

if [[ $# -eq 1 ]]; then
    if [ -d "$1" ]; then
        echo -e "${BLUE}'$1'${NC}"
        hiddenFilesCount=$(ls -a $1 | grep "^\." | wc -l)
        find $1 -maxdepth 1 -type f -size -6144c -printf "%P\t%M\t%s byte\n"
        echo -e "${CYAN}Hidden files count: $hiddenFilesCount${NC}"
    else
        echo -e "${RED}'$1'${NC}"
    fi
elif [[ $# -eq 0 ]]; then
    echo -e "${RED}Adjon meg legalább egy paramétert!${NC}"
else
    echo -e "${RED}Csak egy paraméter megadása lehetséges!${NC}"
fi
