#!/bin/bash

# Írja ki azon legfiatalabb 3 hölgy adatait, akinek a nevében szerepel az “S” és a “a” betű, és 600000-nél kevesebbet keresnek! Az egyszerűség kedvéért feltételezhetjük, hogy különböző napokon születtek. (awk felhasználásával) (3)
awk -F\^ '
BEGIN{}
{
    if($3=="hölgy") {
        if(match($2, "[Sa]+") && $6 < 600000) {
            result[$4] = $1" "$2" "$3" "$4" "$5" "$6
        }
    }
}
END {
    n=asorti(result, sorted)
    j=1
    for(i=n;i>1;i--) {
        if(j==5) {
            break
        }
        j++
        print result[sorted[i]]
    }
}
' adat

#  Melyik hónapban született a legtöbb hölgy? Listázzuk az egyes hónapok sorszámait, és az akkor született hölgyek számát, darabszám szerint csökkenő sorrendben.(awk felhasználásával) (3)
awk -F\^ '
BEGIN{}
{
    if($3 == "hölgy") {
        split($4, date, ".")
        result[date[2]]++
    }
}
END {
    for(i in result) {
        print i" "result[i]
    }
}
' adat | sort -rk2

# Melyik keresztnév a leggyakoribb az urak körében? Írassuk ki az egyes keresztneveket és az adott keresztnévvel rendelkező urak %-os arányát négy tizedes jegy pontossággal, %-os arány szerinti csökkenő sorrendben. (csak awk-t használva) (6)
awk -F\^ '
BEGIN{}
{
    if($3=="úr") {
        split($2, name, " ")
        lastNames[name[2]]++
        counter++
    }
}
END {
    for(i in lastNames) {
        printf "%s %.6s%\n", i, (lastNames[i] / counter) * 100
    }
}
' adat | sort -rk2
