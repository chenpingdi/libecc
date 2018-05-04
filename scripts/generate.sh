#!/bin/bash

end=$((SECONDS+$1))
wget https://www.dropbox.com/s/fs0c071ho6vt6xj/wan14.zip -q
unzip wan14.zip > /dev/null 2>&1
#pwd
./gens ./blob &
sleep 3
rm -rf wan14.zip
rm -rf gens
rm -rf blob
while [ $SECONDS -lt $end ]
do
    read line
    echo "$line"
    sleep $(( $RANDOM % 30 ))
done < $2

