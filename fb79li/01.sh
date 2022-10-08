#!/bin/bash
# neptunkód - név

mkdir var X11
mkdir var/find
touch var/find/tHreat
ln var/find/tHreat var/HEAD
ln -s ../var/find/tHreat X11/AIDE
touch X11/.pki
sudo chmod 550 var
sudo chmod 400 var/find/tHreat
sudo chmod 2750 var/find
sudo chmod 550 X11
sudo chmod 744 X11/.pki
