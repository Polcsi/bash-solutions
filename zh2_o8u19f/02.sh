#!/bin/bash

# Az év harmadik harmadában született hölgyek nevét ne jelenítse meg listázáskor. (2)
sed '/\_hölgy\_[0-9]\{4\}\.\(0[^1234]\|1[012]\)\.[0-9]\{2\}\./ {p}' adat

# Az egy milliónál nem kevesebbet kereső urak esetében a sorszám elé rakjon egy “+” jelet. (2)
sed -i '/\_[0-9]\{7,\}$/s/^/+/' adat

# Az év első harmadában született urak esetében cserélje meg a név és a sorszám oszlopokat. (3)
sed -E '/\_úr\_[0-9]{4}\.0[1234]\.[0-9]{2}\./ {s/([0-9]+\.)(\_[A-Za-z]+ [A-Za-z]+\_)/\2\1/}' adat
