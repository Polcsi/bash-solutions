#!/bin/bash

# Az év második harmadában született urak nevét ne jelenítse meg listázáskor. (2)

sed -ri '/`úr`[0-9]{4}\.0[5678]\.[0-9]{2}\./ {s/`[A-Za-z]+ [A-Za-z]+//g}' adat

# Az egy milliónál többet keresők esetében a fizetés után rakjon egy “+” jelet. (2)

# A páros sorszámú sorok esetében ne jelenítse meg a születési idő és a fizetés oszlopokat. (3)
sed -ri '2~2 {s/`[0-9]+$/`/g}' adat
sed -ri '2~2 {s/`[0-9]{4}\.[0-9]{2}\.[0-9]{2}\.//g}' adat
