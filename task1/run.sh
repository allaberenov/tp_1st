#!/bin/bash
mkdir $6
find $6 -name "*.$2" -exec cp {} "$6" \; 
tar -zcf $8.tar.gz "$6"
echo "done"

