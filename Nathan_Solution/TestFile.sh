#!/bin/bash
#Author: Nathan Jager
#if else check if sample txt exists
#fucntions
count_lines(){
	echo "1 entered: The number of lines are:"
	grep "" -c $1
}

count_words(){
	echo "2 entered"
	echo "Lorem occurs this many times:"
	grep -o -i Lorem $1 | wc -l
	echo "model occurs this many times:"
	grep -o -i model $1 | wc -l
	echo "Ipsum occurs this many times:"
	grep -o -i Ipsum $1 | wc -l
	echo "will occurs this many times:"
	grep -o -i will $1 | wc -l
}

add_text(){
	echo "3 entered: Now enter a sentence"
	read sentence
	echo "I learnt about Lorem Ipsum typesetter!!" >> $1
}

copy_and_exit(){
	echo "4 entered: copying files to a new folder"
	mkdir solution
	cp $1 solution
}
#main body
if [ -e "$1" ]
then
	echo "$1 exists."
else
	echo "Error: $1 doesn't exist"
	exit 0
fi
# menu
a=1

while (( a != 0)) 
do
	echo "Choose a option by typing in its number:"
	echo "1: count lines"
	echo "2: count words"
	echo "3: add text"
	echo "4: copy file"
	echo "0: exit"
	read val
	a=$(($val))
	
	if [ $a = 1 ]
	then
		count_lines $1
	elif [ $a = 2 ]
	then
		count_words $1
	elif [ $a = 3 ]
	then
		add_text $1
	elif [ $a = 4 ]
	then
		copy_and_exit $1
	else
		echo "not a number 1-4"
	fi
done
echo "end of script"
