cat $1 >davky
cat $2 >herci
cat $3 > beverly
join -1 1 -2 1 <(sort -k 1 davky) <(sort -k 1 herci)>a
join -1 2 -2 3 a <(sort -k 3 a) | cut -d' ' -f 2,3 >b
join -1 1 -2 1 <(sort -k 1 beverly) <(sort -k 1 b)>a
join -1 2 -2 3 a <(sort -k 3 a) | cut -d' ' -f 2,3 
rm davky
rm herci
rm beverly