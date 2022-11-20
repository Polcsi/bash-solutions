#!/bin/bash

#• Írja ki azon legidősebb 3 hölgy adatait, akinek a nevében szerepel az “S” és a “a” betű, és 600000-nél nem keresnek kevesebbet! Az egyszerűség kedvéért feltételezhetjük, hogy különböző napokon születtek. (awk felhasználásával) (3)
awk -F\% '
BEGIN {}
{
    if(match($2, "[S]+") > 0 && match($2, "[a]+") > 0 && $6 > 600000 && $3 == "hölgy") {
        result[$4] = $1" "$2" "$3" "$4" "$5" "$6
    }
}
END {
    n=asorti(result, sorted)
    for(i=1;i<n;i++) {
        if(i==4) {
            break
        }
        print result[sorted[i]]
    }
}
' adat

# Melyik hónapban született a legtöbb úr? Listázzuk az egyes hónapok sorszámait, és az akkor született urak számát, darabszám szerint csökkenő sorrendben. (awk felhasználásával) (3)
awk -F\% '
BEGIN{}
{
    if($3 == "úr") {
        split($4, parts, ".")
        result[parts[2]]++
    }
}
END {
    for(i in result) {
        print i": "result[i]
    }
}
' adat | sort -rk 2

# Melyik vezetéknév a leggyakoribb az urak körében? Írassuk ki az egyes vezetékneveket és az adott vezetéknévvel rendelkező urak %-os arányát négy tizedes jegy pontossággal, %-os arány szerinti csökkenő sorrendben. (csak awk-t használva) (6)
awk -F\% '
BEGIN{}
{
    if($3=="úr") {
        split($2, names, " ")
        result[names[1]]++
        counter++
    }
}
END {
    for(i in result) {
        printf "%s: %.6s%\n", i, (result[i] / counter) * 100
    }
    print "Length: " counter
}
' adat | sort -rk 2
