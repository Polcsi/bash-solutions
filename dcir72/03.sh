#!/bin/bash

#3.1
awk -F\: '
{
    if($3 == "hölgy") {
        split($2, names, " ")
        if(match(names[1], "[a]+") > 0 && $6 < 700000) {
            array[$4] = $1" "$2" "$3" "$4" "$5" "$6
        } 
    }
}
END {
    n=asorti(array, sorted)
    for(i=1;i<n;i++) {
        if(i == 5) {
            break
        }
        print array[sorted[i]]
    }
}
' adat
#3.2
awk -F\: '
{
    if($3=="úr") {
        cities[$5]++
    }
}
END {
    for(i in cities) {
        print i": "cities[i]
    }
}
' adat | sort -nk 2

#3.3
awk -F\: '
{
    if($3 == "úr") {
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
