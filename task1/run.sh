#!/bin/bash
echo "$1 $2 $3 $4 $5 $6 $7 $8"
mkdir "$6"
find $2/ -name "*.$4" -exec cp {} "$6" \; 
ls
 tar -cvf $8.gz "$6"
 #echo "Done"

