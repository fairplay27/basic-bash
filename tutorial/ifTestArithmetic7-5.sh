#!/bin/bash

a=4
b=5

#  Here "a" and "b" can be treated either as integers or strings.
#  There is some blurring between the arithmetic and string comparisons,
#+ since Bash variables are not strongly typed.

#  Bash permits integer operations and comparisons on variables
#+ whose value consists of all-integer characters.
#  Caution advised, however.

echo

if [ "$a" -ne "$b" ]
then
  echo "$a is not equal to $b"
  echo "(arithmetic comparison)"
fi

echo

if [ "$a" != "$b" ]
then
  echo "$a is not equal to $b."
  echo "(string comparison)"
  #     "4"  != "5"
  # ASCII 52 != ASCII 53
fi

# In this particular instance, both "-ne" and "!=" work.

# Verifica con le stringhe in http://www.tldp.org/LDP/abs/html/ops.html
string1="test1"
string2="test1"

if [ "$string1" = "$string2" ]
  then
    echo "stringhe uguali: string1=>$string1<==>$string2<="
  else
    echo "stringhe diverse: string1=>$string1<==>$string2<="
fi  

unset string1
unset string2

if [ "$string1" = "$string2" ]
  then
    echo "stringhe uguali: string1=>$string1<=string2=>$string2<="
  else
    echo "stringhe diverse: string1=>$string1<=string2=>$string2<="
fi  

# Nota: non torna con quato scritto sull'aggiungere un carattere prima della stringa di confronto
#  if [ "X$string1" = "X$string2" ] is safer,
#+ to prevent an error message should one of the variables be empty.
#  (The prepended "X" characters cancel out.)


let "z=5**3"    # 5 * 5 * 5
echo "z = $z"   # z = 125

w=125			# w = 125
echo "w = $w"  

if [ "$z" -eq "$w" ]
  then
    echo "numeri uguali: z=>$z<=w=>$w<="
  else
    echo "numeri diversi: z=>$z<=w=>$w<="
fi
	
(( w++ ))
echo "w = $w"   # w = 126

if [ "$z" -eq "$w" ]
  then
    echo "numeri uguali: z=>$z<=w=>$w<="
  else
    echo "numeri diversi: z=>$z<=w=>$w<="
fi

	

echo

exit 0