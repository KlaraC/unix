if [ "$1" == "--help" ]; then
echo "Pouziti: uloha02.sh [OPTION] [args]
     --normal    Vypise zadane argumenty ve stejnem poradi
     --reverse   Vypise zadane argumenty v opacnem poradi
     --subst     Vymeni vsechny vyskyty prvniho argumentu druhym argumentem
                 ve vsech nasledujicich
     --len       Vypise delky vsech argumentu na jeden radek";
elif [ "$1" == "--normal" ]; then
for i in "$@" ; do
echo "$i" ;
done
elif [ "$1" == "--reverse" ]; then
for i in "$@"; do
n=$(($n+1));
a[n]=$i;
done;
for ((i=1;i<= "$#"; ++i)) ; do
echo "${a[$#-i+1]}";
done
elif [ "$1" == "--subst" ]; then
a=$2;
b=$3;
shift 3;
for i in "$@"; do
echo ${i//$a/$b};
done
elif [ "$1" == "--len" ]; then
for i in "$@" ; do
echo -n ${#i}" " ;
done;
echo "";
fi