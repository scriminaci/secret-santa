#!/bin/bash

FILE_IN=$1

awk 'NR>1' "$FILE_IN" > .secret_temp.txt
cut -d',' -f1,2 .secret_temp.txt > .secret_mails.txt
cat .secret_temp.txt | perl -MList::Util=shuffle -e 'print shuffle(<STDIN>);' > .secret_shuffle.txt
paste -d',' .secret_mails.txt .secret_shuffle.txt > .secret_combine.txt

cut -d',' -f1,3 .secret_combine.txt | awk '$1 == $2 { print "line " NR " is assigned to the same person " $1"! "}' FS=","
