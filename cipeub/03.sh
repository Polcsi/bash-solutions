#!/bin/bash

#3.1
awk -F\_ '
{
    if($3 == "úr") {
        
        if(match($2, "[B]+") > 0 && match($2, "[t]+") == 0 && $6 < 980000) {
            array[$4] = $1" "$2" "$3" "$4" "$5" "$6
        }
    }
}
END {
    n=asorti(array, sorted)
    for(i=n;i>0;i--) {
        if(i == (n-5)) {
            break
        }
        print array[sorted[i]]
    }
}
' adat

#3.2
awk -F\_ '
{
    if($3 == "úr") {
        city[$5]++
    }
}
END {
    for(i in city) {
        print i": "city[i]
    }
}
' adat | sort -nrk 2

#3.3
awk -F\_ '
{
    if($3 == "úr") {
        split($2, names, " ")
        firstNames[names[1]]++
        counter++
    }
}
END {
    for(i in firstNames) {
        printf "%s: %.6s%\n", i, (firstNames[i] / counter) * 100
    }
}
' adat | sort -k 2
