#!/bin/bash
mkdir $6
find $2/ -name "*.$4" -exec cp {} "$6" \; 
tar -cf $8.gz "$6"
echo "done"

