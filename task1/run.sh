#!/bin/bash
ls
mkdir "$6"
find $2/ -name "*.$4" -exec cp {} "$6" \; 
ls
 tar -cvf $8.gz "$6"
 #echo "Done"

