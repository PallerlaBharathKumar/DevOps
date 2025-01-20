show_linux_menu() {
	echo "Welcome."
	echo "This program helps you to run the commands and get output."
	echo "Example : if you type 1 and press enter, the output is displaced on the terminal"
	echo   "		Press 1: To see date
		Press 2: To see cal
		Press 3: To open firefox
		Press 4: To see process
		Press 5: To see all process
		Press 6: To see kill options
		Press 7: To Create a Directory
		Press 8: To Remove a Directory
		Press 9: To Create a File
                Press 10: To Remove a File"
}


show_docker_menu() {
        echo "Welcome."
        echo "This program helps you to run the commands and get output."
        echo "Example : if you type 1 and press enter, the output is displaced on the terminal"
        echo   "                Press 1: To show the images list.
                Press 2: To show the containers running.
		Press 3: To show the containers list.
                Press 4: To pull a image.
                Press 5: To create a detachable container.
                Press 6: To remove a container.
                Press 7: To enter into a container.
                Press 8: To Start a container.
                Press 9: To stop a container.
                Press 10: To Create a File
                Press 11: To Remove a File"
}




command_run() {
        read -p "Enter a number to run command/exit to exit/menu to show menu: " enteredNo
        if [[ $enteredNo -eq 1 ]];
        then
                echo `date`;
        elif [[ $enteredNo -eq 2 ]];
        then
                echo `cal`;
        elif [[ $enteredNo -eq 3 ]];
        then
                echo `firefox`;
        elif [[ $enteredNo -eq 4 ]];
        then
		echo "$(ps |cat)";
        elif [[ $enteredNo -eq 5 ]];
        then
		echo "$(ps -aux | cat)";
        elif [[ $enteredNo -eq 6 ]];
        then
                echo `kill -l`;
	elif [[ $enteredNo -eq 7 ]];
        then
                read -p "Enter directory name to create: " dir
                echo `mkdir $dir` && echo "directory $dir created successfully!";
	elif [[ $enteredNo -eq 8 ]];
        then
                read -p "Enter directory name to remove: " rmdire
                echo `rmdir $rmdire` && echo "directory $rmdire removed successfully!";
	elif [[ $enteredNo -eq 9 ]];
        then
                read -p "Enter file name to create: " filename
                echo `touch $filename.txt` && echo "File $filename.txt created successully!";
        elif [[ $enteredNo -eq 10 ]];
        then
                read -p "Enter file name to remove: " rmfile
                echo `rm -f $rmfile` && echo "file $rmfile.txt removed successfully!";
	elif [[ $enteredNo == "exit" ]];
        then
                echo "exiting...!"
                exit;
	elif [[ $enteredNo == "menu" ]];
	then 
		show_linux_menu;
	else
                echo "entered no not in database";
        fi
}


ram_status() {
	echo `bash memoryalert.sh`
	echo "$(cat memoryLog.csv)"
}



docker_command_run() {
        read -p "Enter a number to run docker command/exit to exit/menu to show menu: " dockerNo
        if [[ $dockerNo -eq 1 ]];
        then
                echo "$(docker images | cat)"
        elif [[ $dockerNo -eq 2 ]];
        then
		echo "$(docker ps | cat)";
	elif [[ $dockerNo -eq 3 ]];
        then
                echo "$(docker ps -a | cat)";
	elif [[ $dockerNo -eq 4 ]];
        then
                read -p "Enter image name: " imagename;
		read -p "Enter version: " versionname;
		docker pull $imagename:$versionname && echo "Image downloaded Successfully...!"
        elif [[ $dockerNo -eq 5 ]];
        then
                read -p "enter name of container: "  nameofcontainer
		docker run -dit --name $nameofcontainer redhat/ubi8;
		echo "Container created Successfully...!";
        elif [[ $dockerNo -eq 6 ]];
        then
		read -p "enter name of container to remove: "  removecontainer
                echo `docker rm -f $removecontainer` && echo "Container removed Successfully...!";
        elif [[ $dockerNo -eq 7 ]];
        then
		read -p "enter name of container to enter: " entercontainer
		echo "Entering Container...!"
                docker exec -it $entercontainer bash;
        elif [[ $dockerNo -eq 8 ]];
        then
		read -p "enter name of container to Start: " startcontainer
                docker start $startcontainer ;
	elif [[ $dockerNo -eq 9 ]];
        then
                read -p "enter name of container to Stop: " stopcontainer
                docker stop $stopcontainer;
	elif [[ $enteredNo -eq 10 ]];
        then
                read -p "Enter directory name to remove: " rmdire
                echo `rmdir $rmdire` && echo "directory $rmdire removed success"

	elif [[ $dockerNo == "exit" ]];
	then
		echo "exiting...!"
		exit;
	elif [[ $dockerNo == "menu" ]];
        then
		show_docker_menu;
        else
                echo "entered no not in database";
        fi
}


echo "Press 1 to run a command."
echo "Press 2 to check ram status."
echo "Press 3 to create your own OS."
echo "Type exit to exit the program."
read -p "Select a option: " option

if [[ $option -eq 1 ]];
then 
	show_linux_menu;
	read -p "Type yes if you want to run a command: " runcmd; 
	if [[ $runcmd == "yes" ]]; 
	then 
		while : ;
		do
			command_run;
		done	
	elif [[ $runcmd == "no" ]];
	then 
		echo "Exiting program...!"
		exit;
	else 
		echo "Typed something Else...!";
		echo "Exiting program...!"
	fi;

elif [[ $option -eq 2 ]];
then
	ram_status;

elif [[ $option -eq 3 ]];
then 
	show_docker_menu;
        read -p "Type yes if you want to run a Docker command: " dockercmd;
        if [[ $dockercmd == "yes" ]];
        then 
		while :;
		do
			docker_command_run;
		done

	elif [[ $dockercmd == "no" ]];
       	 then
                echo " Exiting docker program...!"
               	exit;
        else
                echo "Typed something Else...!";
                echo "Exiting docker program...!";
	fi;
elif [[ $option == "exit" ]]
then 
	echo "exiting the program"
	exit;
else 
	echo "Entered number not in database...!";
fi

