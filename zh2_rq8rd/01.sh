#!/bin/bash
# Listázza az év középső harmadában született hölgyek nevét, fizetését, fizetés szerint csökkenő sorrendben! (egrep, extended regexp) (3)
egrep --color=always '`hölgy`[0-9]{4}\.0[5678]\.[0-9]{2}\.' adat | cut -d "\`" -f 2,6 --output-delimiter=" " | sort -rk 3
