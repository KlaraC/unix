funkce() {
local max=0;
while read x; do
i=`echo $x | tr , " " | wc -w`
if [ $i -gt $max ]; then
max=$i
fi;
done;
return $max
}

Najdi() {
while read x; do
i=`echo $x | cut -d: -f 4 | tr , " " | wc -w`
if [ $1 -eq $i ]; then
echo $x | cut -d: -f 1
fi
done
}

cut -d: -f 4 group >a
cat a | funkce
ret=$?
cat group | Najdi $ret
