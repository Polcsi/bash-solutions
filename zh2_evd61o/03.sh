#!/bin/bash

# Írja ki azon legidősebb 4 hölgy adatait, akinek a vezetéknevében szerepel az “a” betű, és 700000-nél nem keresnek többet! Az egyszerűség kedvéért feltételezh

awk -F\! '
BEGIN {}
{
    if($3=="hölgy") {
        if(match($2, "[a]+") && $6 <= 700000) {
            result[$4] = $1" "$2" "$3" "$4" "$5" "$6
        }
    }
}
END {
    n=asorti(result, sorted)
    for(i=1;i<n;i++) {
        if(i == 5) {
            break
        }
        print result[sorted[i]]
    }
}
' adat

#  Melyik fizetés a leggyakoribb a Budapestiek körében? Listázzuk a budapesti személyek esetében előforduló fizetéseket, és ezek darabszámát fizetés szerint növekvő sorrendben. (awk felhasználásával) (3)

awk -F\! '
BEGIN {}
{
    if($5=="Budapest") {
        salarys[$6] = $6
    }
}
END {
    asort(salarys)
    for(i in salarys) {
        print salarys[i]
    }
    printf "Budapesti fizetések darabszáma: %s\n", length(salarys)
}
' adat

# Melyik vezetéknév a leggyakoribb az hölgyek körében? Írassuk ki az egyes vezetékneveket és az adott vezetéknévvel rendelkező hölgyek %-os arányát négy tizedes jegy pontossággal, %-os arány szerinti csökkenő sorrendben. (csak awk-t használva) (6)

awk -F\! '
BEGIN {}
{
    if($3=="hölgy") {
        split($2, nameParts, " ")
        firstNames[nameParts[1]]++
        counter++
    }
}
END {
    for(i in firstNames) {
        result[i]=(firstNames[i] / counter) * 100
    }
    for(j in result) {
        printf "%s, %.6s%\n", j, result[j]
    }
}
' adat | sort -rk2
