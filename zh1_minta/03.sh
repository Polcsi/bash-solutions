#!/bin/bash
# harmadik feladat megoldás

declare maxTraffic
declare ipAddress
h="IPv4;Traffic"
for FILE in files/*.csv; do
    while read line; do
        if [[ "$h" != "$line" ]]; then
            parts=(${line//;/ })
            if [[ ${parts[1]} -gt $maxTraffic ]]; then
                let maxTraffic=${parts[1]}
                ipAddress="${parts[0]}"
            fi
        fi
    done <$FILE
done

echo "Legnagyobb öszforgalom itt történt: $ipAddress $maxTraffic"
