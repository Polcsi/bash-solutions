#!/bin/bash
# Pollák Péter Bence - B35S1H

LG='\033[1;32m'
NC='\033[0m'
coloredOutput() {
    if [[ $# -eq 1 ]]; then
        echo -e "${LG}$1${NC}"
    fi
}

for FILE in inputdir/*.xml; do
    coloredOutput $FILE # Ellenőrzés miatt, hogy tudjam melyik fájlba mi található
    xmlData=$(sed -n '/<root>/,/<\/root>/p' $FILE | sed '/root>/d' | sed 's/<[^>]*./;/g')

    xmlParts=(${xmlData// / })
    for i in "${xmlParts[@]}"; do
        rowParts=(${i//;;/ })
        ipParts=(${rowParts[1]//// })
        octets=(${ipParts[0]//./ })
        thirdOctet=${octets[2]}
        modValue=$((thirdOctet % 2))
        if [[ modValue -eq 0 ]]; then
            echo ${rowParts[1]}
        fi
    done
done
