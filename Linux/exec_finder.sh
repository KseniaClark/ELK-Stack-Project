
#!/bin/bash
#l=$(ls)
#for i in ${l[@]}; do
# if [ -x $i ]
# then
#	 echo $i
# fi
#done 


files =find /home -type f -perm 777 2> /dev/null 

for i in ${files[@]} ; do 
 echo $i
 
done
