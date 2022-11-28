#!/bin/bash
# Pollák Péter Bence - B35S1H

#sudo userdel -r nebula
#sudo userdel -r huba
#sudo userdel -r student2
#
#sudo groupdel postfix
#sudo groupdel trolls
#sudo groupdel mariadb

sudo groupadd --gid 91 postfix
sudo groupadd --gid 898 trolls
sudo groupadd --gid 90 mariadb

sudo useradd --uid 1904 --gid 91 nebula
sudo useradd --uid 2110 --gid 898 huba
sudo useradd --uid 3474 --gid 90 student2

path="var/data/data02.json"
d=$(dirname $path)
[ ! -d "$d" ] && sudo mkdir -p $d
sudo touch $path
sudo chmod 0664 $path
sudo chown huba:trolls $path

path="var/data/data03.json"
d=$(dirname $path)
[ ! -d "$d" ] && sudo mkdir -p $d
sudo touch $path
sudo chmod 0400 $path
sudo chown nebula:postfix $path

path="opt/google"
d=$(dirname $path)
[ ! -d "$d" ] && sudo mkdir -p $d
sudo mkdir $path
sudo chmod 0555 $path
sudo chown student2:mariadb $path
