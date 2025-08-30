#!/bin/bash

# This script retrieves and formats file information from a specified directory, displaying it in the same format as the "ls -lh" command.
dir=$1
if [[ ! -d $dir ]]; then
    echo "Directory $dir doesn't exist"
    exit 1
fi
for file in $dir/*; do
    fileInfo=$(stat $file)
    fileName=$(echo $fileInfo | awk '{print $2}' | tr "/" "\n" | tail -1)
    fileSize=$(echo $fileInfo | awk '{print $4}')
    if [[ -f $file ]]; then
        fileAccess=$(echo $fileInfo | awk '{print $19}' | tr "//" "\n" | tail -1 | head -c -2)
        fileLinks=$(echo $fileInfo | awk '{print $17}')
        fileUid=$(echo $fileInfo | awk '{print $23}' | head -c -2)
        fileGuid=$(echo $fileInfo | awk '{print $27}' | head -c -2)
        fileMTime=$(echo $fileInfo | awk '{print $33,$34}')
    else
        fileAccess=$(echo $fileInfo | awk '{print $18}' | tr "//" "\n" | tail -1 | head -c -2)
        fileLinks=$(echo $fileInfo | awk '{print $16}')
        fileUid=$(echo $fileInfo | awk '{print $22}' | head -c -2)
        fileGuid=$(echo $fileInfo | awk '{print $26}' | head -c -2)
        fileMTime=$(echo $fileInfo | awk '{print $32,$33}')
    fi
    fileMTime=$(echo $fileMTime | date +"%b %d %H:%M")
    echo $fileAccess $fileLinks $fileUid $fileGuid $fileSize $fileMTime $fileName
done