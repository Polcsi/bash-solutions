#!/bin/bash
#zh1 harmadik feladat 'mslznt'
# B osztályú ip cím: 128.0.0.1 - 191.255.255.254

for FILE in ../datadir/*.ini; do
    content=$(cat $FILE)
    lines=(${content// / })

    for i in "${lines[@]}"; do
        parts=(${i//=/ })
        ipParts=(${parts[1]//./ })
        if [[ "${ipParts[0]}" -ge "128" && "${ipParts[0]}" -le "191" ]]; then
            echo ${parts[1]}
        fi
    done
done
