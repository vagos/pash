#!/bin/bash

OUT=./output/maximal.txt
touch $OUT

exec 3<&0 
exec 0< <(cat ./README.md) 
cat
exec 0<&3
exec 3<&-

echo <(true) >(true)

echo "start"; ls -l . | grep '.sh' | wc -l; echo "..scripts found here" > $OUT
{ echo "start";
  echo $(ls -l .) | grep '.sh' | wc -l;
  echo "..scripts found here"
} > $OUT

{ ls -R ../ | sort -rn | uniq | head; }  > /dev/null 2>&1 &

tee >(wc -l >&2) < $( echo $OUT ) | gzip > $OUT.gz

# "optional" AND and OR composition operators
[ -f 'pizza.123' ] && ( echo 'exists' >$OUT ) || { echo 'does not' >$OUT; }

wait

