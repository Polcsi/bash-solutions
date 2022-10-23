#!/bin/bash
grep -E --color=always '\<úr\>' adat | grep -E --color=always '\<Dunaújváros\>' | grep -E --color=always '\/[A-Za-z]+[[:space:]][A-Za-z]+\ó\/'

egrep --color=never '\<úr\>' adat | grep -oE --color=auto '[A-Za-z]+[[:space:]][A-Za-z]+.*\/[0-9]{4}\.1[0-2]\.[0-9]{2}\.' | cut -d "/" -f 1,3 --output-delimiter='   ' | sort -rk 3
