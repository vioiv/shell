#!/bin/sh

#  FileOrg.sh
#  Usage: ./FileOrg.sh AbsoluteDirectoryPath
#        ex) ./FileOrg.sh /Files/Location/
#
#  Created by John Kim on 2022/07/07.
#  License: MIT
#

#search_dir="/Files/Location/"

search_dir=$1*
for entry in $search_dir; do
    echo ${entry};
    fileDate=`GetFileInfo -d "${entry}" `
    yearFileDate=$(echo $fileDate | cut -c7-10)
    monthFileDate=$(echo $fileDate | cut -c1-2)
    toMakeDir=$(echo $yearFileDate-$monthFileDate)
    mkdir $toMakeDir
    mv "$entry" $toMakeDir
    echo "$entry" $toMakeDir
done;
