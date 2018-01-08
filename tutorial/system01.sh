#!/bin/bash

LOG_DIR="/var/tmp/"
LOG_TMP_FILE="tmplog.txt"
ERROR_CODE=90

cd $LOG_DIR || {
	echo "impossibile fare cd su directory $LOG_DIR RC:$?"
	exit $ERROR_CODE
}

rm -f $LOG_DIR$LOG_TMP_FILE
echo "cancellazione $LOG_DIR$LOG_TMP_FILE RC:$?"

: > $LOG_DIR$LOG_TMP_FILE
echo "creazione file vuoto $LOG_DIR$LOG_TMP_FILE RC:$?"


echo "Today is : $(date)" | tee -a $LOG_DIR$LOG_TMP_FILE
echo "Date in $LOG_DIR$LOG_TMP_FILE RC:$?"

# -e permette di interpretare i caratteri con \ escape	
echo -e "Users connected are : \\n $(who)" | tee -a $LOG_DIR$LOG_TMP_FILE 
echo "Users in $LOG_DIR$LOG_TMP_FILE RC:$?"

#alternativa MA non funzionano i comandi espansi dentro come $(who)
# echo $'users connected are : \n $(who)'  

echo "system uptime is: $(uptime)" | tee -a $LOG_DIR$LOG_TMP_FILE 
echo "uptime in $LOG_DIR$LOG_TMP_FILE RC:$?"

echo "Log file content...:START -------------------------------------"
cat $LOG_DIR$LOG_TMP_FILE 
echo "Log file content...:END ---------------------------------------"


exit 0