#!/bin/bash

for FILE in elements/*.html; do
    echo $FILE
    tableData=$(sed -n '/<table>/,/<\/table>/p' $FILE | sed '/body>/d' | sed 's/<[^>]*./;/g')

    tableParts=(${tableData// / })
    for i in "${tableParts[@]}"; do
        rowData=(${i//;;/ })
        ipParts=(${rowData[1]//// })
        octets=(${ipParts[0]//./ })
        if [ "${octets[1]}" -lt "128" ]; then
            echo ${ipParts[0]}
        fi
    done
done
