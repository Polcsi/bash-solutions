#!/bin/bash
#Velok Bence-cipeub
m="| ---- | ----- |"

for F in name.md; do
    echo $F
    while read line; do
        if [[ "$m" != "$line" ]]; then
            # Ékezetes változó nevek miatt írt szintaktikai hibát, nem véletlenül használunk angol szavakat a magyar helyett
            # rész=(${line//|/ })
            parts=(${line//|/ })
            # cim=(${rész[1]//// })
            ipAddress=(${parts[1]//// })
            # elsö=(${cim[0]//./ })
            octets=(${ipAddress[0]//./ })

            if [[ "${octets[0]}" -ge "128" && "${octets[0]}" -le "191" ]]; then
                echo ${parts[1]}
            fi
        fi
    done <$F
done # for ciklus nem volt lezárva
