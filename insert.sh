#!/bin/bash
if [ -d Databases ]
then
	clear
	echo "******************** Tables Operations *********************"
	if [[ $# -eq 2 ]]
	then
		if [ -d Databases/$1 ]
		then 
			clear
			echo "******************** Tables Options ON Database [$1] *********************"

			if [ -f Databases/$1/$2 ]
			then
				clear
				echo "*********************** Data Maniplation [Inserting Data] *************************"
				
				if [[ -f Databases/$1/.metaDataOf$2 ]]
				then
					if [[ `wc -l ./Databases/$1/.metaDataOf$2` > 0 ]]
					then
						if [[ `awk -F: 'NR==1{print $2}' Databases/$1/.metaDataOf$2` = "Integer" ]]
						then
							echo "integer value...!"
							echo "Enter Table Data: [col1 col2 col3 ... etc]"
							read recordValues	
							echo [[ $recordValues[0] ]]


							# if [[ "$recordValues[0]" =~ ^[0-9]+$ ]]
							# then 
							# 	let inputLength
							# 	for val in ${recordValues[@]}
							# 	do
							# 		inputLength=$((inputLength+1))
							# 	done
							# 	echo "***********************"
							# 	if [[ $inputLength = `wc -l ./Databases/$1/.metaDataOf$2 | cut -f 1 -d" "` ]]
							# 	then
							# 		echo "$recordValues" >> ./Databases/$1/$2
							# 	else
							# 		echo "Wrong Number Of Columns"
							# 	fi
							# else 
							# 	echo "========================================================="
							# 	echo "First Value must be Integer...!"
							# 	echo "========================================================="
							# 	echo "Do U Want To Retype OR Exit?"
							# 	select item in "Enter (Y) to Retype" "Enter (E) to Exit"
							# 	do
							# 		case $REPLY in
							# 		Y|y) ./insert.sh $1 $2;;
							# 		E|e) ./dataManipulation.sh $1 $2;;
							# 		*) echo "Please Enter a Valid Option...!";;
							# 		esac
							# 	done
							# fi
						else
							echo "String Value...!"
						fi
					else
						echo "========================================================="
						echo "Table has no Columns Till Now, Add Some Columns First...!"
						echo "========================================================="
						echo "Do U Want To Add Some Columns OR Exit?"
						select item in "Enter (Y) to Retype" "Enter (E) to Exit"
						do
							case $REPLY in
							Y|y) ./addingColumn.sh $1 $2;;
							E|e) ./dataManipulation.sh $1 $2;;
							*) echo "Please Enter a Valid Option...!";;
							esac
						done
					fi
				else
					
					echo "========================================="
					echo "There is MetaData File For This Table...!"
					echo "========================================="
					echo "Do U Want To Create One?"
					select choice in "Enter (Y) to Create One" "Enter (E) to Exit"
					do
					case $REPLY in
					E|e) ./dataManipulation.sh $1 $2;;
					Y|y) clear
						 echo "*********************** Data Definition [Adding Column] *************************"
						 touch Databases/$1/.metaDataOf$2
						 echo "=================================================="
					     echo "MetaData File For This Table Created Successfully."
						 echo "=================================================="
						 echo "Do U Want To Add Column?"
						 select item in "Enter (Y) to Add Column" "Enter (E) to Exit"
						 do
						 	case $REPLY in
							Y|y) ./addingColumn.sh $1 $2;;
							E|e) ./dataManipulation.sh $1 $2;;
							*) echo "Please Enter a Valid Option...!"
							esac
						 done
						 ;;
					*) echo "Please Enter a Valid Option...!";;
					esac
				done
				fi
			else 
				echo "==========================="
				echo "No Such Table Exists...!"
				echo "==========================="
				echo "Retype Table Name To Make Data Manipulation or Exit: "
				select choice in "Enter (R) to Retype Table Name" "Enter (E) to Exit"
				do
					case $REPLY in
					E) ./connectDatabase.sh $1;;
					e) ./connectDatabase.sh $1;;
					R) ./dataManipulation.sh $1;;
					r) ./dataManipulation.sh $1;;
					*) echo "Please Enter a Valid Option...!";;
					esac
				done
			fi
		else
			echo "No Such Database Exists...!"
		fi
	else 
		echo "Invalid Arguments...!"
	fi
fi





# echo "******************** Tables Operations *********************"
	# if [[ -f Databases/$1/$2 ]]
	# then
		
	# else
	# 	echo "NO Table With this name EXISTS"
	# fi