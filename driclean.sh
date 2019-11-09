#!/bin/bash

function lineNr(){
	wc -l < find.txt
}

function printline(){
	sed -n $fileNr"p" find.txt
}

function pause(){
   read -p "$*"
}

fileNr=$(lineNr)
workLine=$(printline)
usedSize="10M"

echo "Welcome to driclean, where we misspell and clean dir's"
echo

read -p "State the size of the files you want to find (in MB) `echo $'\n>'`" REPLY
if [[ -n ${REPLY//[0-9]/} ]]; then
	echo "That was not a number. Default size will be used. (10MB)"

else 
	 usedSize="$REPLY""M"
	 echo "looking for" $usedSize "files"
fi

find -type f -size "$usedSize" > find.txt

choise='Delete Compress Ignore Quit'
while [[ $fileNr > 0 ]]; do
	printline
	select name in $choise
	do 
		if [ $name == 'Quit' ]
		then
			exit

		elif  [ $name == 'Ignore' ]; then
				echo there are $fileNr left
				((fileNr--))
				echo "$workLine has been ignored" >>  log.txt
				break

		elif [ $name == 'Compress' ]; then
				 echo there are $fileNr left
				 gzip $workLine
				 ((fileNr--))
				 echo "$workLine has been Compressed" >> log.txt
				 break

		elif [ $name == 'Delete' ]; then
				echo there are $fileNr left
				printline
				rm -f -i -v $workLine
				((fileNr--))
				echo "$workLine has been Deleted" >> log.txt
				break
		fi
	done	
done
pause 'Press [Enter] key to continue...'


