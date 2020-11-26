#!/bin/bash
list_cities=("New York" "Maryland" "Main" "Nebraska" "Hawaii")
yes=0
for i in ${list_cities[@]}; do
	if [ "$i"="Hawaii" ]
	then
		yes=1
	fi
done
if [ "$yes" -eq 1 ]
then
	echo "Hawaii is the best"

else
	echo "Hawaaii is not found"
fi
