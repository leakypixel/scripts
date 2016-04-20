#!/bin/bash

index=1
filenum=1
keyword=$1

for filename in `grep -rIl $keyword --exclude="\*.git\*" .`; do
  echo $filename
  perl -pi -e "s/$keyword/\$& . $filenum . ++\$n{\$ARGV}/ge" $filename

  filenum=$(($filenum + 1))
done
