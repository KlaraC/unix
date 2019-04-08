cat > /tmp/N;
cat /tmp/N | tac > /tmp/N;
if [ "$1" == "-n" ]; then
r=`cat /tmp/N | wc -l`;
p=$r;
p=$((p / $2));
q=$r;
q=$(($q % $2));
if [ "$q" -ne 0 ]; then
p=$(($p+1));
fi
b=$2;
b=$(($b+1));
for (( a=0 ; $a-$p; a=$a+1 )) do
cat /tmp/N | head -$2|tac ;
cat /tmp/N | tail +$b > /tmp/M;
cat /tmp/M > /tmp/N;
done;
else 
cat /tmp/N ;
fi