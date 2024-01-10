#!/bin/bash
function getChildList() {
CH=""
CH=$(pgrep -P $1|tr '\n' ' ')
echo "pids= ${CH}"
}

PARENT=$1
getChildList $PARENT
Child_list="$CH"
Final_list="$CH"

while true; do
ChCh_list=""

j=0
for i in $Child_list ;do
  ((j=$j+1))
  echo "PID[$j] = ${i}"
  getChildList ${i}
  if [[ $CH != "" ]]; then
    ChCh_list="$ChCh_list $CH"
    echo "ChCh_list = $ChCh_list"
  fi
done

if [[ $ChCh_list != "" ]]; then
  Child_list="$ChCh_list"
  Final_list="$Final_list $ChCh_list"
  echo "Final list = $Final_list"
else
  #exit until loop	
  break;
fi	
done

echo "Kill all $Final_list + parent = $PARENT"
kill -KILL $Final_list
