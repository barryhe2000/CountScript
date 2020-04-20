#!/bin/bash
declare -A map
countWords(){
	while read line; do
		for word in $line; do
			key="${word,,}"
			if [ "${map[$key]}" ]; then
				(( map[$key] += 1 ))
			else
				map[$key]=1
			fi
		done
	done < "$1"
}
if [ $# -eq 0 ]; then
	echo 'usage: wordCount.sh <filename>'
	exit
fi	
if [ ! -f "$1" ]; then 
	echo "wordCount.sh: $1: Not a file"
	exit
fi	
countWords $1
for index in "${!map[@]}"; do
	case "${map[$index]}" in
		1 )
			echo "'$index' occurs 1 time."
			;;
		2 )
			echo "'$index' occurs 2 times."
			;;
		3 ) 
			echo "'$index' occurs 3 times."
			;;
		4 )
			echo "'$index' occurs 4 times."
			;;
		* )
			echo "'$index' occurs ${map[$index]} times. WARNING!"
			;;
		esac
done
