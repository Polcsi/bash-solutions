#!/bin/bash
# zh 1 harmadik feladat
# B osztályú ip cím: 128.0.0.1 - 191.255.255.254

strindex() {
    x="${1%%$2*}"
    [[ "$x" = "$1" ]] && echo -1 || echo "${#x}"
}

for FILE in ../../elements/*.html; do

    rawHtml=$(cat "$FILE")
    firstPos=$(strindex "$rawHtml" "<table>")+7
    lastPos=$(strindex "$rawHtml" "</table>")
    length=$lastPos-$firstPos
    table=${rawHtml:$firstPos:$length-14}
    trs=(${table//<tr>/ })

    for i in "${trs[@]}"; do
        tdString="</td><td>"
        firstTdPos=$(strindex "$i" "$tdString")+${#tdString}
        lastTdPos=$(strindex "$i" "</td></tr>")-${#tdString}
        tdLength=$lastTdPos-$firstTdPos-${#tdString}
        ip=${i:$firstTdPos:$tdLength}
        ipParts=(${ip//./ })
        lastDigit=(${ipParts[3]//// })
        if [[ "${ipParts[0]}" -ge "128" && "${ipParts[0]}" -le "191" && "${lastDigit[0]}" -ge "1" && "${lastDigit[0]}" -le "254" ]]; then
            echo $ip
        fi
    done
done
