if [ "$1" == "--help" ]; then
echo "Pouziti: uloha01.sh [--typ|--help] [cesta_k_souboru]
  --typ   Vypise typ souboru popsaneho danou cestou, pokud neexistuje, napise: Neexistuje
  --help  Vypise navod na pouziti tohoto programu
Exit status
  0   soubor existuje
  1   soubor neexistuje"
elif [  "$1" == "--typ" ]; then
 if [ -h "$2" ]; then 
   echo "Symbolicky link"
 elif [ -d "$2" ]; then
   echo "Adresar"
 elif [ -f "$2" ]; then 
   echo "Soubor"
 elif [ -c "$2" ]; then
 echo "znakove zarizeni"
 elif [ -b "$2" ]; then
 echo "blokove zarizeni"
 elif [ -p "$2" ]; then
 echo "fifo"
 elif [ -e "$2" ]; then 
  exit 0
  else
  echo "Neexistuje"
  exit 1
fi
else echo "Chyba"
fi