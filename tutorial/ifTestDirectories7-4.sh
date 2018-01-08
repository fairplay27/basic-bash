#! /bin/bash

# riceve in input una setie di argomenti (nomi di directory o di file) separati da spazio 
#+ p.e. ./ifTestDirectories7-4.sh workfile/ backup01.sh

#  If no args are passed to the script set directories-to-search 
#+ to current directory.  Otherwise set the directories-to-search 
#+ to the args passed.
######################

[ $# -eq 0 ] && directorys=$(pwd) || directorys=$@

##################
for directory in $directorys; do
    if [ -d $directory ]
	then 
	    echo "$directory is a directory"	
	else 
	    echo "$directory is not a directory"
   fi
done

exit 0