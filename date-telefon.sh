#!/bin/bash
FOLD='/home/szirmaigy/Asztal/teszt/recordings'
for x in $FOLD/*.mp3; do
  date=$(echo $x | cut -d"#" -f2)
  Y=${date:0:4}
  m=${date:4:2}
  d=${date:6:2}

    if [ `find $FOLD/. -type d -name $Y` ]; then cd $FOLD/$Y; else mkdir -p $FOLD/$Y && cd $FOLD/$Y; fi
      if [ `find $FOLD/$Y/. -type d -name $m` ]; then cd $FOLD/$Y/$m; else mkdir -p $FOLD/$Y/$m && cd $FOLD/$Y/$m; fi
        if [ `find $FOLD/$Y/$m/. -type d -name $d` ]; then cd $FOLD/$Y/$m/$d; else mkdir -p $FOLD/$Y/$m/$d && cd $FOLD/$Y/$m/$d; fi

          # csak akkor helyezi át, ha a célfájl régebbi, mint a FORRÁS, vagy ha a célfájl nem létezik
          #mv --update $x  $FOLD/$Y/$m/$d/
          mv $x  $FOLD/$Y/$m/$d/
done
