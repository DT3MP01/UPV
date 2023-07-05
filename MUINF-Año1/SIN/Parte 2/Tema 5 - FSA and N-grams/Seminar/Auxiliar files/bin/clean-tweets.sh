#!/bin/bash

if [ $# -ne 1 ] ; then
	echo "Usage: $0 file"
	exit
fi

cat $1 | 
	sed "s/^.*::://g" | 
	awk '{for (i=1;i<=NF;i++) 
	   if (!match($i,"htt.*")) 
             printf("%s ",$i);
	   printf("\n");
        }' | sed "s/ *$//g" |
	#sed "s/htt.* //g" | 
	#sed "s/htt.*$//g" | 
	sed "s/[;,:()-_¡¿»“”·°²…º‘’�•–\+\!\?\.\"]//g" | 
	sed "/^$/d" | 
	sed "s/  */ /g" | 
	iconv -f utf8 -t ascii//translit
