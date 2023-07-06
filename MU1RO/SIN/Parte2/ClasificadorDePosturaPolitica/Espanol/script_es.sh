#!/bin/bash
export PATH=$HOME/W/mallet/Mallet-202108/bin:$PATH
export CLASSPATH=$HOME/W/mallet/Mallet-202108/
export PATH=$HOME/W/binsin:$PATH
export LD_LIBRARY_PATH=$HOME/W/libsin/:$LD_LIBRARY_PATH

# Separar TRAINING Y DATA
clean-tweets.sh training_tweets_es.txt > training_tweets_es_clean.txt
paste -d ":" training_truth_es.txt training_tweets_es_clean.txt | awk 'BEGIN{FS=":";} {print $1"\t"$4"\t"$NF;}' > training_tweets_es_clean_mallet.txt 

cat training_tweets_es_clean_mallet.txt | awk '{if (NR%5==0) print > "val_tweets_es_clean_mallet.txt"; else print > "tr_tweets_es_clean_mallet.txt";}'

awk '{print $1"\tX\tX\t"$2;}' val_tweets_es_clean_mallet.txt > val_tweets_es_clean_mallet.ref


# ## GENERAR LOS DOS MODELOS  tengo 
#Españols

csv2vectors --input tr_tweets_es_clean_mallet.txt --token-regex '[A-Za-z=#1-9@]' --preserve-case --output tr_tweets_es.vectors

mallet import-file --input tr_tweets_es_clean_mallet.txt --output tr_tweets_es.mallet --use-pipe-from tr_tweets_es.vectors --token-regex '[A-Za-z=#1-9@]'

#Etreno
mallet train-classifier --input tr_tweets_es.mallet --trainer MaxEnt --output-classifier tr_tweets_es_clean_mallet.classifier

mallet classify-file --input val_tweets_es_clean_mallet.txt --output val_tweets_es_clean_mallet.out --classifier tr_tweets_es_clean_mallet.classifier 


cat val_tweets_es_clean_mallet.out | LC_NUMERIC=C awk '{l=$2; s=$3; for (i=5;i<=NF;i=i+2) if ($i>s) { s=$i; l=$(i-1); } print $1"\tX\tX\t"l; }' > val_tweets_es_clean_mallet.cl


perl eval.pl val_tweets_es_clean_mallet.ref val_tweets_es_clean_mallet.cl 



# # #####Generar test para el modelo completo
# clean-tweets.sh test_tweets_es.txt > test_tweets_es_clean.txt
# clean-tweets.sh training_tweets_es.txt > training_tweets_es_clean.txt


# paste -d ":" test_tweets_es.txt test_tweets_es_clean.txt | awk 'BEGIN{FS=":";} {print $1"\tXXX\t"$NF;}' > test_tweets_es_clean_mallet.txt 

# paste -d ":" training_truth_es.txt training_tweets_es_clean.txt | awk 'BEGIN{FS=":";} {print $1"\t"$4"\t"$NF;}' > training_tweets_es_mallet.txt 


# csv2vectors --input training_tweets_es_mallet.txt --token-regex '[A-Za-z=#1-9]' --preserve-case --output training_tweets_es_mallet.vectors

# mallet import-file --input training_tweets_es_mallet.txt --output training_tweets_es_mallet.mallet --use-pipe-from training_tweets_es_mallet.vectors --token-regex '[A-Za-z=#1-9]'

# #Entreno
# mallet train-classifier --input training_tweets_es_mallet.mallet --trainer MaxEnt --output-classifier training_tweets_es_mallet.classifier

# mallet classify-file --input test_tweets_es_clean_mallet.txt --output test_tweets_es_clean_mallet.out --classifier training_tweets_es_mallet.classifier 


# cat test_tweets_es_clean_mallet.out | LC_NUMERIC=C awk '{l=$2; s=$3; for (i=5;i<=NF;i=i+2) if ($i>s) { s=$i; l=$(i-1); } print $1"\tX\tX\t"l; }' > test_tweets_es_clean_mallet.cl


















