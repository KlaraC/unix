cut -d\; -f 4 kodyzemi_cz.csv >a
cut -d\; -f 1 countrycodes_en.csv>b
join -t\; -1 1 -2 1 <(sort -k 1 a) <(sort -k 1 b)>c
cut -d\" -f 2 c
rm a
rm b
rm c