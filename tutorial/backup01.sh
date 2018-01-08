#!/bin/bash
echo "Starting $(basename $0) - fullpath: $0"

# This script makes a backup of my home directory.
WORKINGDIR="/home/stefano/"
BACKUP_SOURCE_DIR="tmp"
BACKUP_TARGET_DIR="/var/tmp/"
TAR_FILE="home_stefano_tmp01.tar"
GZIP_FILE="home_stefano_tmp01.tar.gz"
LOG_DIR="/home/stefano/log"
LOG_FILE="tmp_backup.log"
STEFANO_UID=1000
E_NOTSTEFANO=90   	# Non-stefano exit error.
E_XCD=91   			# Errore CD exit error.

exit 0

# Run as stefano, of course.
if [ "$UID" -ne "$STEFANO_UID" ]
then
  echo "Must be stefano (uid=$STEFANO_UID) to run this script."
  exit "$E_NOTSTEFANO"
fi  

echo "ok user uid: $(id)"

#primo metodo per uscire se non riesce a cambiare directory
# cd $WORKINGDIR || exit
# 
#sempre primo metodo solo un po' piu' strutturato
cd "$WORKINGDIR" || {
  echo "Cannot change to necessary directory." >&2
  exit $E_XCD;
}
echo "switch a working directory: $(pwd) RC: $?"

##secondo metodo per uscire se non riesce a cambiare directory
# cd $WORKINGDIR
# echo "COMANDO cd $WORKINGDIR RC: $?"
# if [ "$(pwd)" != "$WORKINGDIR" ]  									
##oppure if [ "$PWD" != "$WORKINGDIR" ]
# then
  # echo "Can't change to $WORKINGDIR."
  # exit "$E_XCD"
# fi  # Doublecheck if in right directory before messing with log file.

# First remove the old tar file.  Redirect errors because this generates some if the archive
# does not exist.  Then create a new compressed file.
rm -f "$BACKUP_TARGET_DIR$GZIP_FILE" 2> /dev/null
echo "cancellazione $BACKUP_TARGET_DIR$GZIP_FILE RC: $?"


# This creates the archive
tar -czvf "$BACKUP_TARGET_DIR$GZIP_FILE" "$BACKUP_SOURCE_DIR" > /dev/null 2>&1
echo "creazione archivio $BACKUP_TARGET_DIR$GZIP_FILE per $BACKUP_SOURCE_DIR RC: $?"


exit 0


# Copy the file to another position
cp $TAR_FILE $WORKINGDIR > /dev/null 2>&1
echo "copia $TAR_FILE in $WORKINGDIR RC: $?"

# Create a timestamp in a LOG_FILE.
mkdir -p $LOG_DIR
echo "creazione directory $LOG_DIR: $?"
date >> $LOG_FILE
echo "backup succeeded" >> $LOG_FILE

 #  A bare "exit" (no parameter) returns the exit status of the preceding command. 
 #  A zero return value from the script upon exit indicates success
exit 0