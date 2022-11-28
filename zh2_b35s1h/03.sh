#!/bin/bash
# Pollák Péter Bence - B35S1H

#3.1 Írja ki azon legidősebb 4 hölgy adatait, akinek a nevében nem szerepel sem az “S”, sem a “k” betű, és 500000-nél nem keresnek kevesebbet! Az egyszerűség kedvéért feltételezhetjük, hogy különböző napokon születtek. (awk felhasználásával) (3)

awk -F\+ '
BEGIN{}
{
    if($3 == "hölgy") {
        if(match($2, "[k]+") == 0 && match($2, "[S]+") == 0 && $6 >= 500000) {
            result[$4]= $1" "$2" "$3" "$4" "$5" "$6
        }
    }
}
END {
    n=asorti(result, sorted)
    for(i=1;i<n;i++) {
        if(i== 5) {
            break
        }
        print result[sorted[i]]
    }
}
' adat

#3.2 Melyik hónapban született a legtöbb hölgy? Listázzuk az egyes hónapok sorszámait, és az akkor született hölgyek számát, darabszám szerint csökkenő sorrendben. (awk felhasználásával) (3)

awk -F\+ '
BEGIN{}
{
    if($3 == "hölgy") {
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

#3.3 Melyik keresztnév a leggyakoribb az hölgyek körében? Írassuk ki az egyes keresztneveket és az adott keresztnévvel rendelkező hölgyek %-os arányát négy tizedes jegy pontossággal, %-os arány szerinti csökkenő sorrendben. (csak awk-t használva) (6)

awk -F\+ '
BEGIN{}
{
    if($3 == "hölgy") {
        split($2, names, " ")
        lastNames[names[2]]++
        counter++
    }
}
END {
    for(i in lastNames) {
        printf "%s: %.6s%\n", i,(lastNames[i] / counter) * 100
    }
}
' adat | sort -rk 2
