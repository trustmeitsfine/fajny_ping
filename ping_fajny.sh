#!/bin/bash

# Do zrobienia 
# Przypisać pingowany adres do zmiennej 

while :
do

    # Current date 
    curr_date=`date "+%d.%m.%y %H:%M:%S"`

    # Because "if" uses last command result  with $? ping MUST be right before it
    ping -c 1 -w 4 8.8.8.8 > /dev/null

    if [ "$?" -ne 0 ]
    then
        count=$(($count+1))
        echo "Internet nie dziala '$curr_date' '$count'"
    else
        count=0
        echo "Internet dziala '$curr_date'"
        sleep 1
    fi

done
