if [ "$3" == '' ] && [ "$4" == '' ]; then
cat > /tmp/N;
elif [ "$4" == '' ]; then
if [ "$1" == "-f" ] || [ "$1" == "--fraction" ]; then
cat > /tmp/N;
else
cat "$3" > /tmp/N;
fi
else 
cat "$4" > /tmp/N;
fi
if [ "$1" == "-l" ] || [ "$1" == "--lines" ]; then
cat /tmp/N |head -$(echo "$2"|cut -d - -f 2) | tail +$(echo "$2" | cut -d - -f 1);
elif [ "$1" == "-f" ] || [ "$1" == "--fraction" ]; then
a=`echo "$3" |cut -d / -f 1`;
b=`echo "$3" |cut -d / -f 2`;
c=`cat /tmp/N | wc -l`;
a=$(( $a * $c ));
ex=`expr $a % $b` ;
if [ $ex == 0 ]; then
a=$(( $a / $b ));
else
a=$(( $a / $b ));
a=$(( $a + 1 ));
fi
b=`echo "$2" |cut -d / -f 1`;
d=`echo "$2" |cut -d / -f 2`;
b=$(( $b * $c ));
b=$(( $b / $d ));
cat /tmp/N | head -$a | tail +$b ;
elif [ "$1" == "-p" ] || [ "$1" == "--part" ]; then
c=`cat /tmp/N | wc -l`;
a=`echo "$2" |cut -d / -f 1`;
b=`echo "$2" |cut -d / -f 2`;
e=$(( $c % $b ));
f=$b;
b=$(( $c / $b ));
if [ $e -gt 0 ] && [ $a == $f ]; then
f=$b;
b=$(( $b + $e ));
else
f=$b;
fi
a=$(( $a - 1 ));
a=$(( $a * $f ));
a=$(( $a + 1 ));
cat /tmp/N | tail +$a | head -$b ; 
fi