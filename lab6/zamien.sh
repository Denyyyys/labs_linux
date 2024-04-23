#!/bin/bash

if [ $# -ne 3 ]; then
    echo "Error: correct executing: ./zamien.sh file text1 text2"
    exit 1
fi

file_path="$1"
if [ ! -e "$file_path" ]; then
    echo "Error: File $file_path does not exist!"
    exit 2
fi

if [ ! -r "$file_path" ]; then
    echo "Error: You don't have read permission for $file_path"
    exit 3
fi

current_index=1
while [ -e $file_path.$current_index ]
do
    current_index=$(($current_index + 1))
done

# echo $2

sed "s|$2|$3|g" $file_path > $file_path.$current_index
# sed "s/$2/$3/g" $file_path > $file_path.$current_index
