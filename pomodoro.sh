#!/bin/bash

# Bash Pomodoro Timer by Bob Pham

# Inputs to be inputed as either 'd' for default or 'timer_length' 'break_length'


# Time in minutes for readability
DEFAULT_LENGTH=25
DEFAULT_BREAK=5
DEFAULT_TIMER_CHARACTER="d"
DEFAULT_BREAK_CHARACTER="s"
TIMER_LENGTH=1
BREAK_LENGTH=1
echo "Initializing Pomodoro Timer..."

function timer () {
	SLEEP_TIME=$(( $TIMER_LENGTH/100 ))

	for (( i=1; i <= 99 ; i++ ))
	do 
		echo -n "Pomodoro in Progress... ["
		
		for (( j=0; j<=$i; j++ ))
		do
			echo -n "#"
		done
	
		for (( j=$i; j<=99;j++ ))
		do
			echo -n " "
		done

		echo -n "]" $i "% Done" $'\r'
		sleep $SLEEP_TIME
	done

	REMAINDER=$(( $(( $TIMER_LENGTH%100 )) + $SLEEP_TIME ))
	
	echo -n "Pomodoro in Progress... ["
	
	for (( j=0; j<=99; j++ ))
	do
		echo -n "#"
	done
	
	echo -n " ] 99% Done" $'\r'
	sleep $REMAINDER
	
	echo -n "Pomodoro in Progress... ["

	for (( j=0; j<=100; j++ ))
	do
		echo -n "#"
	done
	
	echo -n "] 100% Done!" $'\r'
	
	pomodoro_break_prompt

}

function break_timer () {
	SLEEP_TIME=$(( $BREAK_LENGTH/100 ))

	for (( i=1; i <= 99 ; i++ ))
	do 
		echo -n "Break in Progress... ["
		
		for (( j=0; j<=$i; j++ ))
		do
			echo -n "#"
		done
	
		for (( j=$i; j<=99;j++ ))
		do
			echo -n " "
		done

		echo -n "]" $i "% Done" $'\r'
		sleep $SLEEP_TIME
	done

	REMAINDER=$(( $(( $BREAK_LENGTH%100 )) + $SLEEP_TIME ))
	
	echo -n "Break in Progress... ["
	
	for (( j=0; j<=99; j++ ))
	do
		echo -n "#"
	done
	
	echo -n " ] 99% Done" $'\r'
	sleep $REMAINDER
	
	echo -n "Break in Progress... ["

	for (( j=0; j<=100; j++ ))
	do
		echo -n "#"
	done
	
	echo -n "] 100% Done!" $'\r'

	clear
	pomodoro_start_prompt
}

function pomodoro_start_prompt () {
	while true
	do
		read -p "Enter 's' to start your pomodoro timer		" INPUT

		if [ $INPUT == $DEFAULT_BREAK_CHARACTER ]
		then
			break
		fi 

		echo "Invalid Input"
	done

	clear
	timer
}

function pomodoro_break_prompt () {
	clear

	while true
	do
		read -p "Enter 's' to start your break		" INPUT

		if [ $INPUT == $DEFAULT_BREAK_CHARACTER ]
		then
			break
		fi 

		echo "Invalid Input"
	done

	clear
	break_timer

}

function pomodoro_init () {
	read -p "Enter 'd' for default time or 'timer_length' 'break_length'		" VAR1 VAR2

	if [[ $VAR1 == $DEFAULT_TIMER_CHARACTER ]]
	then
		TIMER_LENGTH=$(($DEFAULT_LENGTH*60))
		BREAK_LENGTH=$(($DEFAULT_BREAK*60))
	else
		TIMER_LENGTH= $(($VAR1*60))
		BREAK_LENGTH=$(($VAR2*60))
	fi

	clear
	pomodoro_start_prompt
}


if [[ $1 == $DEFAULT_TIMER_CHARACTER ]]
then
	TIMER_LENGTH=$(($DEFAULT_LENGTH*60))
	BREAK_LENGTH=$(($DEFAULT_BREAK*60))
	timer
elif [[ "$1" -eq 0 ]] && [[ "$2" -eq 0 ]];
then
	pomodoro_init
else 
	TIMER_LENGTH=$(($1*60))
	BREAK_LENGTH=$(($2*60))
	timer
fi



