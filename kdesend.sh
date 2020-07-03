 #!/bin/bash
 
GREEN='\033[0;32m' 
LGREEN='\033[1;32m' 
WHITE='\033[1;37m'
YELL='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color


filename="$1"
pathname=$(dirname "$1")
basename=$(basename "$1")
extension="${filename##*.}"
name_no_ext="${basename%.*}"


#kdesend command line tool, version 09-03-2019

#check variable existence
if [ -z "$1" ]; then
  echo 'Indiquez un fichier à envoyer'
exit
fi


#check if absolute or relative path
if [[ "$1" = /* ]]; then
   filename=$1
else
   filename=$PWD/$1
fi


#echo $filename>/home/boony/test.txt
#echo $PWD>>/home/boony/test.txt

#echo "sending file $filename"

result=$(kdeconnect-cli -d $(kdeconnect-cli -a --id-only) --share "$filename")

zenity --notification --text "\n$result" --timeout 1

