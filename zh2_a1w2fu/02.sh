#!/bin/bash

# Csak az év utolsó negyedévében született urakat jelenítse meg. (2)
sed -nr '/\/úr\/[0-9]{4}\.1[012]\.[0-9]{2}\./p' adat

# Az egy milliónál kevesebbet kereső urak esetében a sorszám elé rakjon egy “-” jelet. (2)
sed -i '/\/úr\/.*\/[0-9]\{1,6\}$/s/^/-/' adat

# Az év első harmadában született urak esetében a születési idő oszlopot módosítsa úgy, hogy csak a születési év látszódjon. (3)
sed -i '/\<úr\>/ {s/\.[0-9]\{2\}\.[0-9]\{2\}\.//g}' adat
