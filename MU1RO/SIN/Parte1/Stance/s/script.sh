#!/bin/bash
export PATH=$HOME/W/binsin:$PATH
export LD_LIBRARY_PATH=$HOME/W/libsin/:$LD_LIBRARY_PATH

## Separar TRAINING Y DATA
clean-tweets.sh training_tweets_es.txt > training_tweets_es_clean.txt


cat training_tweets_es_clean.txt | awk '{ if (NR%40==0) print > "val_tweets_es_clean.txt"; else print > "tr_tweets_es_clean.txt"; }'

cut -d ":" -f 7 training_truth_es.txt | awk '{ if (NR%40==0) print > "val_truth_es.txt"; else print > "tr_truth_es.txt"; }'

cat val_tweets_es_clean.txt | awk '{ n="000"NR; n=substr(n,length(n)-3); print > "val_tweets_es_clean_"n".txt";}'

## GENERAR LOS DOS MODELOS
#FEMALE

cut -d ":" -f 7 tr_truth_es.txt | paste -d " " - tr_tweets_es_clean.txt | grep "^FEMALE" | sed "s/^FEMALE //g" > tr_tweets_es_clean_FEMALE.txt

cat tr_tweets_es_clean_FEMALE.txt | ngram-count -text - -lm female_es.darpa -order 3 -write-vocab vocf_es -unk

awk 'BEGIN{print "<eps>\t0"}{printf("%s\t%d\n",$1,NR);}' vocf_es > vocf_es.tmp 

mv vocf_es.tmp vocf_es

cat female_es.darpa | arpa2fst - | fstprint | fstcompile --isymbols=vocf_es --osymbols=vocf_es --keep_isymbols=true --keep_osymbols=true > female_es.fst

#MALE

cut -d ":" -f 7 tr_truth_es.txt | paste -d " " - tr_tweets_es_clean.txt | grep "^MALE" | sed "s/^MALE //g" > tr_tweets_es_clean_MALE.txt

cat tr_tweets_es_clean_MALE.txt | ngram-count -text - -lm male_es.darpa -order 3 -write-vocab vocm_es -unk

awk 'BEGIN{print "<eps>\t0"}{printf("%s\t%d\n",$1,NR);}' vocm_es > vocm_es.tmp 

mv vocm_es.tmp vocm_es


cat male_es.darpa | arpa2fst - | fstprint | fstcompile --isymbols=vocm_es --osymbols=vocm_es --keep_isymbols=true --keep_osymbols=true > male_es.fst

echo "Ejecutando Validación"


for f in val_tweets_es_clean_*.txt ; do
  ess=`cat $f | awk '{print "<s> "$0" </s>"}'`
  echo $ess | str2fst.pl vocf_es | fstcompile --isymbols=vocf_es --osymbols=vocf_es --keep_isymbols --keep_osymbols > essf.fst
  echo $ess | str2fst.pl vocm_es | fstcompile --isymbols=vocm_es --osymbols=vocm_es --keep_isymbols --keep_osymbols > essm.fst
  fstcompose essf.fst female_es.fst | fstshortestpath | fstrmepsilon | fstprint | LC_NUMERIC=C awk '{s+=$NF;} END{print(s);}' > auxf
  fstcompose essm.fst male_es.fst | fstshortestpath | fstrmepsilon | fstprint | LC_NUMERIC=C awk '{s+=$NF;} END{print(s);}' > auxm
  paste auxf auxm | awk '{if ($1<$2) print "FEMALE"; else print "MALE";}'
done > val_tweets_es_clean_classification.txt


echo "Computando Porcentaje"

paste val_truth_es.txt val_tweets_es_clean_classification.txt | awk '{if ($1==$2) a++;} END{print(a*100/NR);}'


rm val_tweets_es_clean_*