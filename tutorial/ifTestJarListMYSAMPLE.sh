#! /bin/bash
# esercizio per vedere con less la lista dei file contenuti in un 

MY_ERROR_CODE=90

echo "START script=>$(basename $0)<="
echo "ricevuti parametri posizionali : $@ "


if [ $# -eq 0 ]; then
	echo "Manca parametro obbligatorio"
	echo "Usage: $(basename $0) jarfile.jar"
	exit $MY_ERROR_CODE
fi
# sample con variabile interna riga di codice
echo "Passati controlli a riga:${LINENO}"

myJarFile=$1

if [ ! -f $myJarFile ]; then
	echo "File specificato non esiste =>${myJarFile}<="
	exit $MY_ERROR_CODE
fi


if [ ${myJarFile##*.} != "jar" ]; then
	echo "File specificato non ha estensione jar =>${myJarFile}<="
	exit $MY_ERROR_CODE
fi


# Solo stderr su file
jar -tvf ${myJarFile} 2> error.log | less
if [ ! ${PIPESTATUS[0]} -eq 0 ]; then
	echo "Problema comando jar tvf su =>${myJarFile}<="
	cat error.log
	exit $MY_ERROR_CODE
fi

echo "END script=>$(basename $0)<="
exit 0