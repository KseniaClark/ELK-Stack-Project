#!/bin/bash
echo "enter password: "
read password
openssl enc -pbkdf2 -nosalt -aes-256-cbc -k $password -P>mkeyiv.txt
