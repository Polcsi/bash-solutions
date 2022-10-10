#!/bin/bash
# Pollák Péter Bence - B35S1H

#sudo userdel -r student4
#sudo userdel -r user3
#sudo userdel -r student5
#
#sudo groupdel postfix
#sudo groupdel admins
#sudo groupdel hacks

sudo groupadd --gid 91 postfix
sudo groupadd --gid 80 admins
sudo groupadd --gid 122 hacks

sudo useradd --uid 1785 --gid 91 student4
sudo useradd --uid 2770 --gid 80 user3
sudo useradd --uid 3599 --gid 122 student5

path="srv/tftp"
d=$(dirname $path)
[ ! -d "$d" ] && sudo mkdir -p $d
sudo mkdir $path
sudo chmod 2750 $path
sudo chown student5:hacks $path

path="var/www/img/logo.jpg"
d=$(dirname $path)
[ ! -d "$d" ] && mkdir -p $d
sudo touch $path
sudo chmod 4755 $path
sudo chown student4:postfix $path

path="data/data02.xml"
d=$(dirname $path)
[ ! -d "$d" ] && sudo mkdir -p $d
sudo touch $path
sudo chmod 0666 $path
sudo chown user3:admins $path
