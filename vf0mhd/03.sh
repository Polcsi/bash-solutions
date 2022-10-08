#!/bin/bash
#C osztályú IP-címe: az első bájt 192 - 223 (192.0.0.1 ~ 223.255.255.254) között van.

firstRow="| ---- | ----- |"

for FILE in input/*.md; do
    while read line; do
        if [[ "$firstRow" != "$line" ]]; then # line="| eno1 | 10.0.0.254/24 |""
            parts=(${line//|/ })              # parts[0]="eno1", parts[1]="10.0.0.254/24"
            ip=(${parts[1]//// })             # ip[0]="10.0.0.254" ip[1]="24"
            octets=(${ip[0]//./ })            # octets[0]="10", octets[1]="0"....

            if [[ "${octets[0]}" -ge "192" && "${ocetets[0]}" -le "223" ]]; then
                echo ${parts[1]}
            fi
        fi
    done <$FILE
done
