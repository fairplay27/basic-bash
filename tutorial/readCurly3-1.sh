#!/bin/bash
# Reading lines in /etc/fstab.

#esempio di curly braces per code block

#particolare: assegnazioni fatte dentro al blocco valgono anche fuori
a=123
{ a=321; }
echo "a = $a"   # a = 321   (value inside code block)


File=/etc/fstab

{
read line1
read line2
read line3
} < $File

echo "First line in $File is:"
echo "$line1"
echo
echo "Second line in $File is:"
echo "$line2"
echo
echo "Third line in $File is:"
echo "$line3	"

exit 0

# Now, how do you parse the separate fields of each line?
# Hint: use awk, or . . .
# . . . Hans-Joerg Diers suggests using the "set" Bash builtin.