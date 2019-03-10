test -h $2
if [ $? == 0 ]; then 
a=0
else a=1
fi
test -d $2
if [ $? == 0 ]; then
b=0
else b=1
fi
test -f $2
if [ $? == 0 ]; then
c=0
else c=1
fi
test -e $2
if [ $? == 0 ]; then
d=0 
else d=1
fi
if [ $1 == "--help" ]; then
echo "Pouziti: uloha01.sh [--typ|--help] [cesta_k_souboru]
  --typ   Vypise typ souboru popsaneho danou cestou, pokud neexistuje, napise: Neexistuje
  --help  Vypise navod na pouziti tohoto programu
Exit status
  0   soubor existuje
  1   soubor neexistuje"
elif [  "$1" == "--typ" ]; then
 if [ $a == 0 ]; then 
   echo "Symbolicky link"
 elif [ $b == 0 ]; then
   echo "Adresar"
 elif [ $c == 0 ]; then 
   echo "Soubor"
 elif [ $d == 1 ]; then 
  echo "Neexistuje"
  exit 1
fi
fi