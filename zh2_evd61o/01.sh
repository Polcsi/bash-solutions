#!/bin/bash

#Listázza azon hölgyek nevét és lakóhelyét, akik keresztneve P-betűvel kezdődik, és Miskolciak (grep, basic regexp)?
grep -G --color=never '\<hölgy\>' adat | grep -oG --color=auto '[A-Za-z].\+[[:space:]][Tt][A-Za-z]\+\/.*\<Miskolc\>' | cut -d "/" -f 1,4 --output-delimiter="   "

#Listázza az év második harmadában született urak nevét, lakóhelyét, lakóhely szerint növekvő sorrendben! (egrep, extended regexp)
egrep --color=always '\<úr\>\![0-9]{4}\.0[456]' adat1 | cut -d "!" -f 2,5 --output-delimiter="   " | sort -k 3
