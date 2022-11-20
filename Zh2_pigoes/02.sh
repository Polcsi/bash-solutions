#!/bin/bash

# Az év negyedik negyedévében született hölgyek esetében szúrjon be egy üres sort az adott sor elé. (2)

sed '/\%hölgy\%[0-9]\{4\}\.1[012]\./s/^/\n/' adat
# sed '/\%hölgy\%[0-9]\{4\}\.1[012]\./s/$/\n/' adat

# Az év utolsó harmadában született személyeket ne listázza ki. (2)
sed -nr '/\%[0-9]{4}\.(0[^9]|1[^012])\./ {p}' adat

# A nem Dunaújvárosi urak esetében cserélje meg a sorszám és a fizetés oszlopot. (3)

sed -e '/<úr>/ !{/Dunaújváros/{n};s/(.[0-9][0-9].)(%[A-Z].)(%[0-9])$/\1\3\2/}' adat
