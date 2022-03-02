#!/bin/bash
mkdir $8
find $4 -name "*.$2" -exec cp {} "$8" \; 
tar -zcf $6.tar.gz "$8"
echo "done"

