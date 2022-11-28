#!/bin/bash

for FILE in datadir/*.ini; do
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
