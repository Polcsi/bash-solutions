#!/bin/bash

for FILE in ../zh1_minta/files/*.csv; do
    arr=$(cat $FILE | awk '{ if ($1!="IPv4;Traffic") { print $1}}' | awk -F ';' '{print $1}' | awk -F '.' '{ if ($3=="0") {print $0}}')
    # find those ip addresses where third octet equal 0

    for i in "${arr[*]}"; do
        printf "$i\n"
    done
done
