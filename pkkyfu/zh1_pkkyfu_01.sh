#!/bin/bash
# zh 1 első feladat

LG="\033[1;32m"
NC="\033[0m"
PWD=$(pwd)
if [[ ! -d "$PWD/f_01" ]]; then
    mkdir f_01
fi

cd f_01
mkdir find tWeet
touch find/.hidden
touch tWeet/home
mkdir tWeet/tWeaks
ln tWeet/home tWeet/tWeaks/Grafana
ln -s tWeet/home tWeet/tWeaks/IScsi
chmod 0400 find/.hidden
chmod 2550 find
chmod 640 tWeet/home
chmod 2750 tWeet/tWeaks
chmod 2550 tWeet

echo -e "${LG}~${NC}"
ls -li
echo -e "${LG}/find${NC}"
ls -lia find
echo -e "${LG}tWeet/${NC}"
ls -li tWeet
echo -e "${LG}tWeet/tWeaks${NC}"
ls -li tWeet/tWeaks
tree -a

cd ..
