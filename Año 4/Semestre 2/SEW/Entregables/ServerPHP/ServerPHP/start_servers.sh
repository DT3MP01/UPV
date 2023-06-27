#!/bin/bash
mkfifo pfifo
while true; do ./server_html.sh | nc -q0 -l 20000 ; done &
while true; do ./server_php.sh <./pfifo | nc -q0 -l 9000 > ./pfifo ; done 
