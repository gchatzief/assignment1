#!/bin/bash

touch kenos-fakelos
touch arxeio
count=0
count1=0

filename1="/home/george/testdir/assignment1/askisi1/arxeio"
while IFS= read -r line1
do
   k=$line1
   count=$((count+1))
done < "$filename1"

i=$((count-2))

while IFS= read -r line1
do
   k=$line1
   if [ $count1 -eq $i ]
   then
     r=$line1 
   fi
   count1=$((count1+1))
done < "$filename1"

filename='/home/george/testdir/assignment1/askisi1/URL'
n=1

while IFS1= read -r line
do 
d=$((n+k))
if [[ $(echo $line |cut -c1-1) == "#" ]]
then 
 echo ""
 
fi
wget -O - $line | tee f.$d | md5sum > m.$d


       if [ $d -eq $n ]
       then 
           r=1
           echo " $line INIT"
       else
           diff m.$r m.$d  >/dev/null 2>&1
           if [ $? -eq 0 ]
           then 
              echo ""
           else  
              echo " $line "
           fi
           if [ $? -eq 2 ]
           then 
             echo "FAILED"
           fi
       fi
        
r=$((r+1))
n=$((n+1))     

done < "$filename"

echo " $((n+k)) "  >> arxeio

