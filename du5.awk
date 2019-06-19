#!/usr/bin/awk -f
BEGIN {
RS="<"
FS=">"
 }
/^[Aa] / {
    for (i=1; i<= NF; ++i) {
      if ( $i~ / *[Hh][rR][Ee][Ff][ \n	]*=[ \n	]*[".*"'.*']/) {
        l=$i
        while ( l~ / *[Hh][Rr][Ee][Ff][ \n	]*/) {
          pocet=index(l,"\"")
          if (pocet == 0 ) {
            pocet=index(l,"'")
          }
          l=substr(l, pocet+1) 
        }
        pocet=index(l,"\"") 
        if (pocet == 0){
        pocet=index(l,"'")
        }
        l=substr(l,1,pocet)
        gsub("'", "", l)
        gsub("\"", "", l)
        gsub("&quot;", "\"", l)
        gsub("&lt;", "<", l)
        gsub("&gt;", ">", l)
        gsub("&amp;", "\\&", l)
        print l
     }
     else
      if ( $i~ / *[Hh][Rr][Ee][Ff][ \n	]*=/) {
        pocet=index($i, "=")
        l=substr($i, pocet+1)
        gsub("&quot;", "\"", l)
        gsub("&lt;", "<", l)
        gsub("gt;", ">", l)
        gsub("&amp;", "&", l)
        print l
        }
    }
}