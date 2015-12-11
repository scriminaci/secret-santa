#!/bin/bash

IFS=","
while read f1 f2 f3 f4 f5 f6 f7 f8 f9 f10 f11       
do     
	MAIL=$f2   
    SANTA=$f1
    NAME=$f3
    SCARPE=$f5
    ALTEZZA=$f6
    PESO=$f7
    OCCHI=$f8
    CAPELLI=$f9
    NASCITA=$f10
    ET=$f11
    
    sed 's/_SANTA_/'$SANTA'/g' mail_body.txt | sed 's/_MAIL_/'$MAIL'/g' | sed 's/_NAME_/'$NAME'/g' | sed 's/_SCARPE_/'$SCARPE'/g' | sed 's/_ALTEZZA_/'$ALTEZZA'/g' | sed 's/_PESO_/'$PESO'/g' | sed 's/_OCCHI_/'$OCCHI'/g' | sed 's/_CAPELLI_/'$CAPELLI'/g' | sed 's/_NASCITA_/'$NASCITA'/g' | sed 's/_ETA_/'$ET'/g' | mail -s "Secret Santa" $MAIL
done < .secret_combine.txt  