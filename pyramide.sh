#!/bin/bash

function pyramide() {
  paramIsValid="false"

  if [[ $1 =~ ^[0-9]+$ ]]
  then
    if (($1 >= 1 && $1 <= 9))
    then
      paramIsValid="true"
    fi
  fi

  if [[ $paramIsValid != true ]]
  then
    while :; do
      read -p "Which number between 1-9?: " number
      if [[ $number =~ ^[0-9]+$ ]]
        then
          if ((number >= 1 && number <= 9))
          then
            break
          else
            echo "The number is out of range, try again"
          fi

        else
          echo "The input is not a valid number, try again"
          continue
      fi
    done
  else
    number=$1
  fi

  a=0
  while (($a <= $number ))
  do
    b=0
    while (($b < ($number - $a)))
    do
      echo -n " "
      b=`expr $b + 1`
    done

    b=0
    while (($b < $a))
    do
      echo -n "$a "
      b=`expr $b + 1`
    done
    echo
    a=`expr $a + 1`
  done
}