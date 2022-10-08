#!/bin/bash
LG='\033[1;32m'
NC='\033[0m'
coloredOutput() {
    if [[ $# -eq 1 ]]; then
        echo -e "${LG}$1${NC}"
    fi
}

base="f_01"
[ ! -d "$base" ] && sudo mkdir $base

path="$base/A/B/D"
d=$(dirname $path)
[ ! -d "$d" ] && sudo mkdir -p $d
sudo touch $path
sudo chmod 2755 $d
sudo chmod 755 "$base/A"

hardlink="$base/A/C"
sudo ln $path $hardlink
sudo chmod 640 $hardlink

symLink="$base/A/E"
sudo ln -s B $symLink

path="$base/A/B/F"
sudo touch $path
sudo chmod 2650 $path

sudo touch "$base/G"
sudo chmod 711 "$base/G"

cd $base
coloredOutput "$base"
sudo ls -li
coloredOutput "$base/A"
sudo ls -li A
coloredOutput "$base/A/B"
sudo ls -li A/B
sudo tree -a
cd ..

sudo rm -r $base
