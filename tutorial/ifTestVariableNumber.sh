#! /bin/bash
#+ riferimento https://stackoverflow.com/questions/806906/how-do-i-test-if-a-variable-is-a-number-in-bash
DEFAULT=123default456

# prende come input il primo parametro oppure il default
[ $# -eq 0 ] && string="$DEFAULT" || string=$1

echo "Ricevuto in input =>$string<="

case $string in
    ''|*[!0-9]*) echo bad ;;
    *) echo good ;;
esac

exit 0