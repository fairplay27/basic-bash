#!/bin/bash

#  Tip:
#  If you're unsure how a certain condition might evaluate,
#+ test it in an if-test.


#true è un comando che restituisce return code 0
if true
then
	echo "comando true vale true"  # questo
else
	echo "comando true vale false"
fi
#false è un comando che restituisce return code 1
if false
then
	echo "comando false vale true"  
else
	echo "comando false vale false" # questo
fi

echo

#comando nullo rc=0
if :
then
	echo "comando nullo vale true"  # questo
else
	echo "comando nullo vale false"
fi

echo

if comandointesistente | :
then
	echo "pipe errore ma ultimo comando ok vale true" #questo
else
	echo "pipe errore ma ultimo comando ok vale false" 
fi

echo

# nota: se si vuole vedere rc di ogni comando vedere $PIPESTATUS

if comandointesistente | : ; test ${PIPESTATUS[0]} -eq 0
then
	echo "pipe errore e controllo finale vale true"
else
	echo "pipe errore e controllo finale ok vale false" #questo
fi

echo


if : | comandointesistente
then
	echo "pipe errore ma ultimo comando errore vale true"
else
	echo "pipe errore ma ultimo comando errore vale false" #questo
fi



# Nota: equivale a test 0
# test string equivale a test -n string quindi testa solo se non vuota
echo "Testing \"0\""
if [ 0 ]      # zero
then
  echo "0 is true."
else          # Or else ...
  echo "0 is false."
fi            # 0 is true.

echo

# Nota: equivale a test 1
echo "Testing \"1\""
if [ 1 ]      # one
then
  echo "1 is true."
else
  echo "1 is false."
fi            # 1 is true.

echo

echo "Testing \"-1\""
if [ -1 ]     # minus one
then
  echo "-1 is true."
else
  echo "-1 is false."
fi            # -1 is true.

echo

echo "Testing \"NULL\""
if [ ]        # NULL (empty condition)
then
  echo "NULL is true."
else
  echo "NULL is false."
fi            # NULL is false.

echo

echo "Testing \"xyz\""
if [ xyz ]    # string
then
  echo "Random string is true."
else
  echo "Random string is false."
fi            # Random string is true.

echo

echo "Testing \"\$xyz\""
if [ $xyz ]   # Tests if $xyz is null, but...
              # it's only an uninitialized variable.
then
  echo "Uninitialized variable is true."
else
  echo "Uninitialized variable is false."
fi            # Uninitialized variable is false.

echo

echo "Testing \"-n \$xyz\""
if [ -n "$xyz" ]            # More pedantically correct.
then
  echo "Uninitialized variable is true."
else
  echo "Uninitialized variable is false."
fi            # Uninitialized variable is false.

echo


xyz=          # Initialized, but set to null value.

echo "Testing \"-n \$xyz\""
if [ -n "$xyz" ]
then
  echo "Null variable is true."
else
  echo "Null variable is false."
fi            # Null variable is false.


echo


# When is "false" true?

echo "Testing \"false\""
if [ "false" ]              #  It seems that "false" is just a string ...
then
  echo "\"false\" is true." #+ and it tests true.
else
  echo "\"false\" is false."
fi            # "false" is true.

echo

echo "Testing \"\$false\""  # Again, uninitialized variable.
if [ "$false" ]
then
  echo "\"\$false\" is true."
else
  echo "\"\$false\" is false."
fi            # "$false" is false.
              # Now, we get the expected result.

#  What would happen if we tested the uninitialized variable "$true"?

echo

exit 0