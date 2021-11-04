#!/bin/bash

if [[ $# -ne 2 ]]
then
	echo -e "Usage: crypt.sh\\n-d	decrypt\\n-e	encrypt\\nThis script uses SHA and 7z to encrypt of decrypt archives"
exit
fi

src=`echo $2 | rev | cut -d'/' -f 1 | rev`
if [ ${#src} -gt 0 ]
then
	ls $src
else
	src=`echo $2 | rev | cut -d'/' -f 2 | rev`
	ls $src
fi

if [[ $? -ne 0 ]]
then
	echo -e "src to work on is not found, make sure you operate from the correct path\\nBye..."
	exit
elif [[ $1 == '-e' ]]
then
	pwd=`echo -n $src | shasum -a 256 | sed "s/ //g" | sed "s/-//g"`
	echo "Compressing with Password:$pwd"

	#7z [a(archive)|x(extract)] [-p<pwd>] <archive_name> <folder/file_to_archive>
	7z a -p$pwd ~/encrypted/$src.7z $src
elif [[ $1 == '-d' ]]
then
	
	file=`echo -n $src | cut -d'.' -f1`
       	pwd=`echo -n $file | shasum -a 256 | sed "s/ //g" | sed "s/-//g"`
        echo "Decrypting with Password:$pwd"

        #7z [a(archive)|x(extract)] [-p<pwd>] <archive_name> <folder/file_to_archive>
        7z x -p$pwd $src
fi
