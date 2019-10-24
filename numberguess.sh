#!/usr/bin/bash

guess=-1
typeset -i num=0

echo -e "Guess a number between 1 and 100\n"

### Generate random number
(( answer = RANDOM % 100 + 1 ))

### Play game
while (( guess != answer )); do
    num=$((num+1))
  	read -p "Enter guess $num: " guess
  	 if (( guess < answer )); then
  		   echo "Higher..."
  	    elif (( guess > answer )); then
  		      echo "Lower..."
  	fi
  done
  echo -e "Correct! That took $num guesses.\n"



  read -r -p "Do you want to play again? (yes/no) " -n 1 -r
  echo    # (optional) move to a new line
  if [[ ! $REPLY = "yes" ]]
  then
      exec ./numberguess.sh
    else
      exit
  fi
