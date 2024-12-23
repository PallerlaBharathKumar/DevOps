echo press 1 to run ubuntu container
echo press 2 to date
#hi

echo please enter any number to get the command:
read enteredNo
if [[ $enteredNo -eq 1 ]]
then
	echo you printed $enteredNo;
elif [[ $enteredNo -eq 2 ]]
then
        echo you printed `expr $enteredNo \* 2`;
elif [[ $enteredNo -eq 3 ]]
then
        echo you printed `date`;
fi

