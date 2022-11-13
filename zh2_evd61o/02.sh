#!/bin/bash

# Az év utolsó harmadában született hölgyek nevét ne jelenítse meg listázáskor
sed -n '/\!hölgy\![0-9]\{4\}\.\(0[^9]\|1[^012]\)\./ {p}' adat

# Az egy milliónál kevesebbet keresők esetében a sorszám elé rakjon egy “-” jelet. (2)
sed -i '/\![0-9]\{1,6\}$/s/^/-/' adat

# A páratlan sorszámú sorok esetében ne jelenítse meg a nem és a városnév oszlopokat. (3)
sed '1~2 {s/\![A-Za-z]\+\!/!/g}' adat
