#!/bin/bash
for i in {0..9}; do
   if [ "$i" -eq 3 ] || [ "$i" -eq 5 ] || [ "$i" -eq 7 ]
	then 
	echo $i	
 fi 
done
