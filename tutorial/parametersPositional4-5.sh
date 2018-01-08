#!/bin/bash

# Call this script with at least 10 parameters, for example
# ./scriptname 1 2 3 4 5 6 7 8 9 10
MINPARAMS=10

args=$#           # Number of args passed.
lastarg=${!args}
# Note: This is an *indirect reference* to $args ...
echo "args =>${args}<="
echo "lastarg =>${lastarg}<=" # ! come puntatore quindi !$# come se fosse puntatore a $# numero-totale-parametri (che corrisponde all'ultimo parametro visto che si comincia a contare da 1)


# Or:       lastarg=${!#}             (Thanks, Chris Monson.)
# This is an *indirect reference* to the $# variable.
# Note that lastarg=${!$#} doesn't work.

echo

echo "The name of this script is \"$0\"."
# Adds ./ for current directory
echo "The name of this script is \"$(basename $0)\"."
# Strips out path name info (see 'basename')

echo

if [ -n "$1" ]              # Tested variable is quoted.
then
 echo "Parameter #1 is $1"  # Need quotes to escape #
fi 

if [ -n "$2" ]
then
 echo "Parameter #2 is $2"
fi 

if [ -n "$3" ]
then
 echo "Parameter #3 is $3"
fi 

# ...


if [ -n "${10}" ]  # Parameters > $9 must be enclosed in {brackets}.
then
 echo "Parameter #10 is ${10}"
fi 

echo "-----------------------------------"
# Nota: 	
# The implementation of "$*" has always been a problem and realistically should have been replaced with the behavior of "$@". In almost every case where coders use "$*", they mean "$@". "$*" Can cause bugs and even security holes in your software.
echo "All the command-line parameters are: =>"$*"<="
echo "All the command-line parameters are: =>"$@"<="

if [ $# -lt "$MINPARAMS" ]
then
  echo
  echo "This script needs at least $MINPARAMS command-line arguments!"
fi  

echo

exit 0