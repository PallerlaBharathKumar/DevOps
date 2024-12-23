while :
do
    usedMemory=`free -m | head -2 | tail -1 | awk '{print $3;}'`
    totalMemory=`free -m | head -2 | tail -1 | awk '{print $2;}'`

    usedPercentage=`expr $usedMemory \* 100 / $totalMemory`
    echo -e "Date= "date +%Y-%m-%d\n"Time= "date +%H:%M:%S\n"Ram Usage="$usedPercentage" >> memoryLog.csv
    if [[ $usedPercentage -ge 80 ]]
    then
        echo "Ram Alert" | espeak-ng
        exit
    else
        echo "Everything is Fine" | espeak-ng
        exit
    fi
    sleep 5
done