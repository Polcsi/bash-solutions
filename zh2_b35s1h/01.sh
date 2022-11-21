#!/bin/bash
# Pollák Péter Bence - B35S1H

#1.1 Listázza azon urak adatait, akik keresztneve nem S-betűvel kezdődik, és nem Miskolciak (egrep, extended regexp)? (2)
egrep --color=always -v '[[:space:]]S.+\.[0-9]{2}\.\+Miskolc\+' adat

#1.2 Listázza az év középső harmadában született hölgyek nevét, fizetését, fizetés szerint csökkenő sorrendben! (grep, basic regexp) (3)
grep --color=always -G '\+[0-9]\{4\}\.0[5678]\.[0-9]\{2\}\.' adat | grep -G '\<hölgy\>' | cut -d "+" -f 2,6 --output-delimiter=" " | sort -rk 3
