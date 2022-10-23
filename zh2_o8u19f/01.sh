#!/bin/bash

#Listázza azon urak adatait, akik keresztneve nem T-betűvel kezdődik, és nem Dunaújvárosiak (egrep, extended regexp)?
egrep --color=never '[A-Za-z]+[[:space:]][^Tt][A-Za-z]+\_úr\_' adat2 | egrep -v 'Dunaújváros'

# Listázza az év középső harmadában született hölgyek nevét, fizetését, fizetés szerint csökkenő sorrendben! (grep, basic regexp)
grep -G --color=never '\_hölgy\_[0-9]\{4\}\.0[5678]\.[0-9]\{2\}' adat2 | cut -d "_" -f 2,6 --output-delimiter="   " | sort -rk3
