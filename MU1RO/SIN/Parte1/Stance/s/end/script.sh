#!/bin/bash
export PATH=$HOME/W/binsin:$PATH
export LD_LIBRARY_PATH=$HOME/W/libsin/:$LD_LIBRARY_PATH

## Separar TRAINING Y DATA


## GENERAR LOS DOS MODELOS
#FEMALE

cut -d ":" -f 7 training_truth_es.txt | paste -d " " - training_tweets_es_clean.txt | grep "^FEMALE" | sed "s/^FEMALE //g" > training_tweets_es_clean_FEMALE.txt

cat training_tweets_es_clean_FEMALE.txt | ngram-count -text - -lm female_es.darpa -order 6 -write-vocab vocf_es -unk

awk 'BEGIN{print "<eps>\t0"}{printf("%s\t%d\n",$1,NR);}' vocf_es > vocf_es.tmp 

mv vocf_es.tmp vocf_es

cat female_es.darpa | arpa2fst - | fstprint | fstcompile --isymbols=vocf_es --osymbols=vocf_es --keep_isymbols=true --keep_osymbols=true > female_es.fst

#MALE

cut -d ":" -f 7 training_truth_es.txt | paste -d " " - training_tweets_es_clean.txt | grep "^MALE" | sed "s/^MALE //g" > training_tweets_es_clean_MALE.txt

cat training_tweets_es_clean_MALE.txt | ngram-count -text - -lm male_es.darpa -order 6 -write-vocab vocm_es -unk

awk 'BEGIN{print "<eps>\t0"}{printf("%s\t%d\n",$1,NR);}' vocm_es > vocm_es.tmp 

mv vocm_es.tmp vocm_es


cat male_es.darpa | arpa2fst - | fstprint | fstcompile --isymbols=vocm_es --osymbols=vocm_es --keep_isymbols=true --keep_osymbols=true > male_es.fst

echo "Ejecutando"


clean-tweets.sh test_tweets_es.txt > test_tweets_es_clean.txt

cat test_tweets_es_clean.txt | awk '{ n="000"NR; n=substr(n,length(n)-3); print > "test_tweets_es_clean_"n".txt"; close ("test_tweets_es_clean_"n".txt")}'

for f in test_tweets_es_clean_*.txt ; do
  ess=`cat $f | awk '{print "<s> "$0" </s>"}'`
  echo $ess | str2fst.pl vocf_es | fstcompile --isymbols=vocf_es --osymbols=vocf_es --keep_isymbols --keep_osymbols > essf.fst
  echo $ess | str2fst.pl vocm_es | fstcompile --isymbols=vocm_es --osymbols=vocm_es --keep_isymbols --keep_osymbols > essm.fst
  fstcompose essf.fst female_es.fst | fstshortestpath | fstrmepsilon | fstprint | LC_NUMERIC=C awk '{s+=$NF;} END{print(s);}' > auxf
  fstcompose essm.fst male_es.fst | fstshortestpath | fstrmepsilon | fstprint | LC_NUMERIC=C awk '{s+=$NF;} END{print(s);}' > auxm
  paste auxf auxm | awk '{if ($1<$2) print "FEMALE"; else print "MALE";}'
done > test_tweets_es_result_classifier.txt

rm test_tweets_es_clean_*.txt
