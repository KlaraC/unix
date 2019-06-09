Mala() {
while [ $# -gt 0 ]; do
  if  echo "$1" | grep -qe [ABCDEFGHIJKLOPQRSTUVWXYZ] ; then
  b=`echo "$1"`
  elif  echo "$1" | grep -qe [M] ; then
  b=`echo "$1"`
  elif  echo "$1" | grep -qe [N] ; then
  b=`echo "$1"`
  else 
  if [ -e "`echo "$1" | tr a-z A-Z`" ]; then
  echo "Soubor jiz existuje, nelze prejmenovat - " "$1" >&2
  b="`echo "$1"`"
  else
  IFS=$'\n'
  mv "$1" `echo "$1" | tr a-z  A-Z `
  b=`echo "$1" | tr a-z A-Z`
  IFS=' 	
  '
  fi
  fi
  if  [ -d "$b" ] ; then 
  cd "$b"
  IFS=$'\n'
  Mala `ls`
  IFS=' 	
  '
  cd \.\.
  fi
shift
done
}

Velka() {
while [ $# -gt 0 ]; do
  if  echo "$1" | grep -qe [[:lower:]] ; then
  b=`echo "$1"`
  else
  if  [ -e  "` echo "$1" | tr A-Z a-z`" ]; then
  echo "Soubor jiz existuje, nelze prejmenovat - " "$1"  >&2
  b="`echo "$1"`"
  else
    IFS=$'\n'
    mv "$1" `echo "$1" | tr A-Z a-z`
    b=`echo "$1" | tr A-Z a-z`
    IFS=' 	
    '
  fi
  fi
  if [ -d "$b" ]; then
  cd "$b"
  IFS=$'\n'
  Velka `ls`
  IFS=' 	
  '
  cd \.\.
  fi
shift
done
}

if [ "$1" == "-r" ]; then 
a="-r"
shift
else a="a"
fi
if [ "$a" == "-r" ]; then
if [ $# -gt 0 ]; then
Mala  "$@"
else
IFS=$'\n'
Mala `ls`
IFS=' 	
'
fi
else
if [ $# -gt 0 ]; then 
Velka "$@"
else
IFS=$'\n'
Velka `ls`
IFS=' 	
'
fi
fi