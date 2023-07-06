#!/bin/bash
re='^\b[0-9]\b'
if [ ! -z "$1" ] && [[ $1 =~ $re ]]
  then
    { printf "practica\ncos\n1\n$1\n1\nyes\n\n\033\0334\n"; } | telnet 158.42.181.26
    else
    echo "No se ha pasado un parametro"
fi





