#!/bin/bash
# zh 1.feladat megoldás 'mslznt'

LG='\033[1;32m'
NC='\033[0m'
PWD=$(pwd)
if [[ ! -d "$PWD/mslznt_01" ]]; then
    mkdir mslznt_01
fi

cd mslznt_01
mkdir EtAlone LILO
touch LILO/tmp
mkdir EtAlone/.hidden
touch EtAlone/.hidden/git
ln EtAlone/.hidden/git EtAlone/.hidden/GRUB
ln -s EtAlone/.hidden/git dOxyGEN
chmod 2755 EtAlone
chmod 1755 LILO
chmod 640 LILO/tmp
chmod 555 EtAlone/.hidden
chmod 400 EtAlone/.hidden/git

echo -e "${LG}EtAlone/.hidden${NC}"
ls -li EtAlone/.hidden
echo -e "${LG}EtAlone${NC}"
ls -lia EtAlone
echo -e "${LG}~${NC}"
ls -li .
tree -a

cd ..
