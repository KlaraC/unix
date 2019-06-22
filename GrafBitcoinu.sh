wget https://g.kurzy.cz/graf-kryptomena/bitcoin-usd-670-400-20190101-20191231.svg 2> /dev/null
mv bitcoin-usd-670-400-20190101-20191231.svg Kurzy
for i in `seq 1 7`; do
cas=` date +"%F %T" --date "$i days ago"`
cas=`echo $cas | grep -o [0-9]*-[0-9]*-[0-9]*`
cas=`echo $cas | sed 's/\([0-9]*\)-\([0-9]*\)-\([0-9]*\)/\3.\2.\1/g'`
cat Kurzy | grep -oE "$cas - [0-9]+" >> tyden
done
cat tyden | sort -nk 1 > a
mv a tyden
cat tyden | sort -nrk 3 > a
cat a | cut -d' ' -f3 >> ceny
max=`sed -n '1p' ceny`
min=`sed -n '$p' ceny`
rozdil=`expr $max - $min`
echo -n $max"	"
rozdil=`expr $rozdil / 20`
for i in `seq 1 21`; do
vyraz=`expr $max - $i \* $rozdil`
vyraz1=`expr $max - \( $i - 1 \) \* $rozdil`
#echo $vyraz $vyraz1
cat ceny | {
while read x; do
if [ $x -ge $vyraz ]; then 
if [ $x -le $vyraz1 ]; then
cat tyden | {
while read a; do
if echo $a | grep -q `echo $x`; then
if echo $a | grep -q `echo $x` | cut -d' ' -f1 ; then
echo -n "    "$x
fi
else
echo -n "		"
fi
done
}
#echo
#echo -n $x 
fi
fi
done
}
echo
echo -n $vyraz"	"
done
echo
#echo  $min"		"
cat tyden |{
while read b; do
echo -n "	" `echo $b | cut -d' ' -f1`
done
}
echo
rm tyden
rm a
rm ceny