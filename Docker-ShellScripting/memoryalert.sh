while :; 
do 
	usedMemory=`free -m | head -2 | tail -1 | awk '{print $3;}'`; 
	totalMemory=`free -m | head -2 | tail -1 | awk '{print $2;}'`; 
	usedPercentage=`expr $usedMemory \* 100 / $totalMemory`; 
	echo -e "Date= "`date +%Y-%m-%d`  "Time= "`date +%H:%M:%S`  "Ram Usage="$usedPercentage >> memoryLog.csv; 
	if [[ $usedPercentage -ge 80 ]]; 
	then
	       while :;
	       do
		       echo "Ram Alert" | espeak-ng && echo "Max usage...!!!";
	       done
	       exit;
	else 
		echo "Everything is Fine" | espeak-ng;
		echo "Everything is Fine"
		exit; 
	fi;
       	sleep 5; 
done
