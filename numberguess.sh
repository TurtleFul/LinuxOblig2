#!/bin/bash

guess=-1
typeset -i num=0

echo -e "Guess a number between 1 and 100\n"

### Generate random number
(( answer = RANDOM % 100 + 1 ))

### Play game
while (( guess != answer )); do
    num=$((num+1))
  	read -p "Enter guess $num: " guess

    if (( guess == "0")); then
          echo "goodbye. The secret number was $answer"
          sleep 5
          exit

  	 elif (( guess < answer )); then
      echo "Higher..."

  	    elif (( guess > answer )); then
  		      echo "Lower..."
  	fi
  done
  echo -e "Correct! That took $num guesses.\n"

  read -p "Do you want to play again? (yes/no) " REPLY
  echo    # (optional) move to a new line
  if [[ $REPLY == "yes" ]]
  then
      exec ./numberguess.sh
    else
      echo "Thank you for playing"
      exit
  fi
