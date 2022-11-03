#!/bin/bash
#Velok Bence-cipeub

GRAY='\e[37m'   # változókat nagy betűvel kell deklarálni
YELLOW='\e[33m' # hiányzó egyenlőség
BASE='\e[0m'

if [ $# -ne 1 ]; then
    echo "egy paraméter!"
else
    if [ -d "$1" ]; then
        echo -e "${YELLOW}$1${BASE}" # változók cseréje
        find $1 -maxdepth 1 -type f -size +2048c -printf "%P,%s\n"
        m=$(find $1 -maxdepth 1 -type f | -SetGid -l | wc -l) # setGid parancs nem található, nem létezik ilyen kapcsoló. Nem tudom pontosan a feladatot, ezért nem tudom javítani. A wc -l parancsal tudjuk megszámolni a sorokat, hogy hány darab van.
        echo "darab: $m db"
    else
        echo -e "${YELLOW}$1${BASE}" # változók cseréje
    fi
fi # hiányzó fi, az első if nem került lezárásra
