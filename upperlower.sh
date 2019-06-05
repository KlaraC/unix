Mala() {
while [ $# -gt 0 ]; do
  if ( echo "$1" | grep -qe [ABCDEFGHIJKLOPQRSTUVWXYZ] ) ; then
  b=`echo "$1"`
  elif ( echo "$1" | grep -qe [M] ); then
  b=`echo "$1"`
  elif ( echo "$1" | grep -qe [N] ); then
  b=`echo "$1"`
  else 
  if ( ls | grep -qe `echo "$1" | tr a-z A-Z`) ; then
  echo "Soubor jiz existuje, nelze prejmenovat - " "$1" >&2
  b=`echo "$1"`
  else
  echo "$1"
  mv "$1" `echo "$1" | tr a-z A-Z`
  b=`echo "$1" | tr a-z A-Z`
  fi
  fi
  if  TestNaAdresar $b ; then 
  cd `echo "$b"`
  Mala `ls`
  cd \.\.
  fi
shift
done
}

Velka() {
while [ $# -gt 0 ]; do
  if ( echo "$1" | grep -qe [[:lower:]]) ; then
  b=`echo "$1"`
  else
  if ( ls | grep -qe ` echo "$1" | tr A-Z a-z`);then
  echo "Soubor jiz existuje, nelze prejmenovat - " "$1"  >&2
  b=`echo "$1"`
  else
    mv "$1" `echo "$1" | tr A-Z a-z`
    b=`echo "$1" | tr A-Z a-z`
  fi
  fi
  if TestNaAdresar "$b" ; then
  cd `echo "$b"`
  Velka `ls`
  cd \.\.
  fi
shift
done
}

TestNaAdresar() {
if [ -d "$1" ] ; then
return 0
else 
return 1
fi
}

if [ "$1" == "-r" ]; then 
a="-r"
shift
else a="a"
fi
if [ "$a" == "-r" ]; then
if [ $# -gt 0 ]; then
Mala `echo $@`
else
Mala `ls`
fi
else
if [ $# -gt 0 ]; then 
Velka `echo $@`
else
Velka `ls`
fi
fi