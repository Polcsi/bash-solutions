#!/bin/bash
# Pollák Péter Bence - B35S1H

#2.1 Az év első harmadában született urak fizetését ne jelenítse meg listázáskor. (2)
sed -ri '/\+úr\+[0-9]{4}\.0[1234]\.[0-9]{2}\./ {s/\+[0-9]+$//g}' adat

#2.2 Az egy milliónál nem kevesebbet kereső hölgyek esetében a sorszám elé rakjon egy “+” jelet. (2)
#sed -i '/\+hölgy\+.*\+[0-9]\{7,\}$/s/^/+/' adat

#2.3 Az év utolsó harmadában született hölgyek esetében a születési idő oszlopot módosítsa úgy, hogy csak a születési év látszódjon. (3)
#sed -i '/\<hölgy\>/ {s/\.\(09\|1[012]\)\.[0-9]\{2\}\.//g}' adat
