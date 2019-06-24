wget https://g.kurzy.cz/graf-kryptomena/bitcoin-usd-670-400-20190101-20191231.svg 2> /dev/null
mv bitcoin-usd-670-400-20190101-20191231.svg Kurzy
for i in `seq 31 -1 1`; do
cas=` date +"%F %T" --date "$i days ago"`
cas=`echo $cas | grep -o [0-9]*-[0-9]*-[0-9]*`
cas=`echo $cas | sed 's/\([0-9]*\)-\([0-9]*\)-\([0-9]*\)/\3.\2.\1/g'`
cat Kurzy | grep -oE "$cas - [0-9]+" >> tyden
done
cat tyden | sort -nrk 3 > a
cat a | cut -d' ' -f3 >> ceny
max=`sed -n '1p' ceny`
rozdil=`expr $max / 30`
echo -n $max"	| "
for i in `seq 1 31`; do
vyraz=`expr $max - $i \* $rozdil`
cat tyden | {
while read a; do
x=`echo $a | cut -d' ' -f3`
if [ $x -gt $vyraz ]; then
echo -n x"  "
#fi
else
echo -n "   "
fi
done
}
if [ $vyraz -ge 0 ]; then
echo
echo -n $vyraz "	| "
fi
done
echo
echo -n "        "
for j in `seq 90`; do
echo -n "-"
done
echo
rm tyden
rm a
rm ceny