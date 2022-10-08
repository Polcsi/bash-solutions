#!/bin/bash
# Második feladat megoldása, első zh

sudo userdel -r student1
sudo userdel -r abc123
sudo userdel -r loser

sudo groupdel admins
sudo groupdel users
sudo groupdel testers

sudo groupadd --gid 80 admins
sudo groupadd --gid 100 users
sudo groupadd --gid 150 testers

sudo useradd --uid 1200 --gid 100 student1
sudo useradd --uid 2000 --gid 150 abc123
sudo useradd --uid 3000 --gid 100 loser

base="f_02"
[ ! -d "f_02" ] && sudo mkdir f_02

path="$base/var/www/A.html"
d=$(dirname $path)
[ ! -d "$d" ] && sudo mkdir -p $d
sudo touch $path
sudo chmod 0750 $path
sudo chown student1:testers $path

path="${base}/data/B"
d=$(dirname $path)
[ ! -d "$d" ] && sudo mkdir -p $d
sudo mkdir $path
sudo chmod 2751 $path
sudo chown abc123:admins $path

path="${base}/opt/C"
d=$(dirname $path)
[ ! -d "$d" ] && sudo mkdir -p $d
sudo touch $path
sudo chmod 0640 $path
sudo chown loser:users $path

cd $base
sudo tree -a
cd ..

sudo rm -r $base
