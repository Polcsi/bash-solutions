#!/bin/bash

# Írja ki azon legidősebb 4 hölgy adatait, akinek a vezetéknevében szerepel az “a” betű, és 700000-nél kevesebbet keresnek! Az egyszerűség kedvéért feltételezhetjük, hogy különböző napokon születtek. (awk felhasználásával) (3)
awk -F\` '
{
    if($3 == "hölgy") {
        if(match($2, "[a]+") > 0 && $6 >= 700000) {
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

# Melyik hónapban született a legtöbb úr? Listázzuk az egyes hónapok sorszámait, és az akkor született urak számát, darabszám szerint csökkenő sorrendben. (awk felhasználásával) (3)
awk -F\` '
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

# Listázza ki azon városokat növekvő sorrendben, ahol legalább egy olyan hölgy lakik, akinek a fizetése meghaladja a februárban született urak legmagasabb fizetését! (csak awk-t használva) (6)

awk -F\` '
BEGIN {
   max=0
}
{
    split($4, parts, ".")
    if($3 == "úr" && parts[2] == "02") {
        if($6 > max) {
            max = $6
        }
    }
}
END {
    print max
}
' adat
