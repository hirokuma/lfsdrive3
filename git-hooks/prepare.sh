#!/bin/bash

fileid="1One1PR5Odvu6cKpQsAMl9nL2fQ-OYWZJ"
filename="app-debug.apk"

if [ -f "$filename" ]; then
	sha256sum --status -c ${filename}.asc
	if [ $? -eq 0 ]; then
		exit 0
	fi
	rm -f $filename}
fi

echo "download: $filename"
html=`curl -c ./cookie -s -L "https://drive.google.com/uc?export=download&id=${fileid}"`
curl -s -Lb ./cookie "https://drive.google.com/uc?export=download&`echo ${html}|grep -Po '(confirm=[a-zA-Z0-9\-_]+)'`&id=${fileid}" -o ${filename}
rm -f cookie
sha256sum --status -c ${filename}.asc
if [ $? -ne 0 ]; then
	echo "bad sum"
	exit -1
fi
