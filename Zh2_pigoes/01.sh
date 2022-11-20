#!/bin/bash

# Listázza azon urak adatait, akik keresztneve P-betűvel kezdődik, és Miskolciak (egrep, extended regexp)? (2)
egrep ' P.+\%' adat | egrep '\%úr' | egrep 'Miskolc'
#grep -G ' P.\+\%' adat | grep -G '\%úr' | grep -G 'Miskolc'
#egrep '[[:space:]]P.+\%úr\%.+\Miskolc\%' adat

# Listázza az év középső harmadában született urak nevét, fizetését, fizetés szerint csökkenő sorrendben! (egrep, extended regexp) (3)
egrep '\%úr\%' adat | egrep '[0-9]{4}\.0[5678]\.' | cut -d "%" -f 2,6 | sort -rk 2

#egrep '\%úr\%' adat | egrep '[0-9]{4}\.(0[89]|1[012])\.'
