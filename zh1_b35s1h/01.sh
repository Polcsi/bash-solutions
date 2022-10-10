#!/bin/bash
# Pollák Péter Bence - B35S1H

LG='\033[1;32m'
NC='\033[0m'
coloredOutput() {
    if [[ $# -eq 1 ]]; then
        echo -e "${LG}$1${NC}"
    fi
}

mkdir iNodes sbin
ln -s sbin MoD
mkdir sbin/INFO
touch sbin/INFO/AIDE
touch iNodes/Cgroup
ln iNodes/Cgroup iNodes/boot

sudo chmod 666 sbin/INFO/AIDE
sudo chmod 755 iNodes/Cgroup
sudo chmod 1755 iNodes
sudo chmod 550 sbin
sudo chmod 2550 sbin/INFO

# Ellenőrzésképpen
#coloredOutput "root"
#ls -li
#coloredOutput "sbin"
#ls -li sbin
#coloredOutput "iNodes"
#ls -li iNodes
#coloredOutput "sbin/INFO"
#ls -li sbin/INFO
#tree -a
