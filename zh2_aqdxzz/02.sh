#!/bin/bash

# Csak az év nem középső kettő negyedévében született hölgyeket jelenítse meg. (2)
# Extended
sed -nr '/hölgy\^[0-9]{4}\.(0[^4-9]|1[012])\.[0-9]{2}\./ {p}' adat
# Basic
sed -n '/hölgy\^[0-9]\{4\}\.\(0[^4-9]\|1[012]\)\.[0-9]\{2\}\./ {p}' adat

# Az év első harmadában született személyeket ne listázza ki. (2)
sed -n '/[0-9]\{4\}\.0[1234]\.[0-9]\{2\}\./ {p}' adat

# Az év középső harmadában született hölgyek esetében a születési idő oszlopot módosítsa úgy, hogy csak a születési év látszódjon. (3)
sed -i '/\<hölgy\>/ {s/\.0[5678]\.[0-9]\{2\}\.//g}' adat
