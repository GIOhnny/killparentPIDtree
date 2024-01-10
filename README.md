# killparentPIDtree
Script that kills all the childs of a parent PID

1) run script with
 ./parent.sh &

2) List processes
ps -ef
giohnny  11995    25  0 22:00 pts/0    00:00:00 -bash
giohnny  11996 11995  0 22:00 pts/0    00:00:00 -bash
giohnny  11997 11995  0 22:00 pts/0    00:00:00 -bash
giohnny  11998 11995  0 22:00 pts/0    00:00:00 sleep infinity
giohnny  11999 11996  0 22:00 pts/0    00:00:00 -bash
giohnny  12000 11996  0 22:00 pts/0    00:00:00 sleep infinity
giohnny  12001 11997  0 22:00 pts/0    00:00:00 sleep infinity
giohnny  12002 11999  0 22:00 pts/0    00:00:00 sleep infinity

PID 11995 is the parent of 11996, 11997 and 11998
----------- 1st itteration -----------
PID 11996 is the parent of 11999, 12000
PID 11997 is the parent of 12001
----------- 2nd itteration ----------
PID 11999 is the parent of 12002
----------- 3rd itteration ----------

3) run
./killall 111995

OUTPUT
pids= 11996 11997 11998 ==> 1st itteration
PID[1] = 11996
pids= 11999 12000
ChCh_list =  11999 12000
PID[2] = 11997
pids= 12001
ChCh_list =  11999 12000  12001 ==> the list to scan for the second itteration
PID[3] = 11998
pids=
Final list = 11996 11997 11998   11999 12000  12001
PID[1] = 11999
pids= 12002
ChCh_list =  12002 ==> the list to scan for the 3rd itteration
PID[2] = 12000
pids=
PID[3] = 12001
pids=
Final list = 11996 11997 11998   11999 12000  12001   12002 ==> final list to kill
PID[1] = 12002
pids=
Kill all 11996 11997 11998   11999 12000  12001   12002  + parent = 11995
