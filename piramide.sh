#!/bin/bash

#Taking input
read -p "Enter Number:" number

#Outer loop for printing number of rows in pyramid
for((row=1;row<=number;row++))
do
  # Legge in mellomrom for riktig form
    for((spaces=row;spaces<=number;spaces++))
      do
        echo -ne " "
    done
    #Loop for printing 1st part
      for((j=1;j<=row;j++))
      do
        echo -ne $row
    done

      for((l=(row-1);l>=1;l--))
      do
        echo -ne $row
    done

    #echo for printing new line
    echo
done
function pause(){
   read -p "$*"
}


pause 'Press [Enter] key to continue...'

