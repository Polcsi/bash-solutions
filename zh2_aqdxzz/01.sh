#!/bin/bash

#  Azon hölgyek adatai, akiknek a  keresztneve nem T-betűvel kezdődik, és Dunaújvárosiak (grep, basic regexp)
grep -G --color=always '\<hölgy\>' adat | grep -G --color=always '\<Dunaújváros\>' | grep -G --color=always '[[:space:]][^Tt]'

# Listázza az év negyedik negyedévében született urak nevét, születési idejét, születési idő szerint csökkenő sorrendben (grep, basic regexp)
grep -G --color=auto '\<úr\>' adat | grep -oG --color=never '[A-Za-z]\+[[:space:]].*[0-9]\{4\}\.1[0-2]\.[0-9]\{2\}\.' | cut -d "/" -f 1,3 --output-delimiter=' ' | sort -rk 3
