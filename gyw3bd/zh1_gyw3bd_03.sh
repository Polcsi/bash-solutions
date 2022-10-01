#!/bin/bash
# zh1 harmadik feladat
#                    |
# 3-ik oktet 192.168.0.1

for FILE in ../../elements/*.html; do
    echo "$FILE"
    tableData=$(sed -n '/<table>/,/<\/table>/p' "$FILE" | sed '/body>/d' | sed 's/<[^>]*./;/g')
    # other solution
    #echo "cat //html/body/table" | xmllint --html --shell "$FILE" | sed '/^\/ >/d' | sed 's/<[^>]*.//g' | xargs
    tableParts=(${tableData// / })
    for i in "${tableParts[@]}"; do
        rowData=(${i//;;/ })
        ipParts=(${rowData[1]//./ })
        if [[ "${ipParts[2]}" -lt "8" ]]; then
            echo ${rowData[1]}
        fi
    done
done
