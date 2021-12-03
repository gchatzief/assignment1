#!/bin/bash
# Our custom function
count=0
count1=0
touch arxeio1
filename1="/home/george/testdir/assignment1/askisi1/arxeio1"
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

parallel_function()
{
  wget -o - $1 | tee file.$d | md5sum > md5.$d
}
 
while IFS= read -r url
do
        d=$((n+k))
        if [ $d -eq $n ]
        then 
          r=0
          echo " $url INIT" 
        fi
        if [[ $(echo $url |cut -c1-1) = "#" ]]
        then 
           echo ""
        else
           parallel_function "$url" &
           diff md5.$r md5.$d  >/dev/null 2>&1
           if [ $? -eq 1 ]
           then 
             echo " $url "
           else 
             echo ""
           fi
           if [ $? -eq 2 ]
           then
             echo " $url FAILED"
           fi
        fi  

r=$((r+1))  
n=$((n+1))
done < "$filename"


echo " $((n+k)) " >> arxeio1
