#!/bin/bash
# harmadik feladat megoldás

declare max
declare ipAddress
h="IPv4;Traffic"
for FILE in *.csv; do
    while read -r line; do
        if [[ "$h" != "$line" ]]; then
            parts=(${line//;/ })
            if [[ ${parts[1]} -gt $max ]]; then
                let max=${parts[1]}
                ipAddress="${parts[0]}"
            fi
        fi
    done <$FILE
done

echo "Legnagyobb öszforgalom itt történt: $ipAddress $max"
