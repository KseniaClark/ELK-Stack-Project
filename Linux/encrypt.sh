#!/bin/bash
echo "enter name of the planetext message file"
read filename
echo "enter  the name of a key and IV file "
read passwordfile
key=$(grep "key" $passwordfile | awk -F = '{print $2}')
iv=$(grep -i "iv" $passwordfile| awk -F ' =' '{print $2}')
echo $key
echo $iv
echo $filename
openssl enc -aes-256-cbc -d -pbkdf2 -nosalt -base64 -in "$filename" -out Out.txt -K "$key" -iv "$iv"
