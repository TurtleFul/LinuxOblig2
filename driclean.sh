#!bin/bash

deafaultsize="10MB"

echo "Welcome to driclean, where we misspell and clean dir's\n"
echo

read -r -p "State the size of the files you want to find (in MB) \n"
if [[ -n ${REPLY//[0-9]/}]]
then 
    echo $REPLY
  else
    echo $deafaultsize
fi  

read -r -p "wait for input"
