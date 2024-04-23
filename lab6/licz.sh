#!/bin/bash


if [ $# -lt 1 ]; then
    echo "Error: you provided 0 arguments. Correct executing: licz.sh [-R] katalog [typ]"
    exit 1
fi

if [ $# -gt 3 ]; then
    echo "Error: too many arguments! Maximum amount = 3. Provided: $#"
    exit 2
fi

if [ $1 != "-R" ] && [ ! -d "$1" ]; then
    echo "Error: first argument can be either option -R or path to directory. Provided: $1"
    exit 3
fi

if [ $1 = "-R" ] && [ ! -d "$2" ]; then
    echo "Error: if first parameter is option -R, then second parameter should be name of directory! Provided: $2"
    exit 4
fi

types=("f" "d" "r")
third_argument_is_type=false
number_count=0
if [ $# -eq 3 ]; then
    for item in "${types[@]}"; do
        if [ "$3" = "$item" ]; then
            third_argument_is_type=true
            break
        fi
    done
    if [ "$third_argument_is_type" != true ]; then
        echo "Error: third argument should be type! Provided: $3"
        exit 5
    fi

    # echo "correct 3 arguments"
    a=$(find "$2" 2>/dev/null)

    if [ $? -ne 0 ]; then
        echo "Error: Some directories are not accessible"
        exit 7
    fi

    number_count=$(find $2 -mindepth 1 -type $3 -not -name '.' -not -name '..'  | wc -l)
    echo $number_count
    exit 0
fi


if [ $# -eq 1 ]; then
    # echo "only directory"
    if [ ! -r $1 ]; then
        echo "Error: You don't have read permission for folder: $1!"
        exit 6
    fi
    number_count=$(find $1 -mindepth 1 -maxdepth 1 -not -name '.' -not -name '..' | wc -l)
    echo $number_count
    exit 0
fi

if [ $# -eq 2 ]; then
    if [ -d $1 ]; then
        # echo "directory and type"
        if [ ! -r $1 ]; then
          echo "Error: You don't have read permission for folder: $1!"
            exit 6
        fi        
        number_count=$(find $1 -mindepth 1 -maxdepth 1 -type $2 -not -name '.' -not -name '..' | wc -l)
        echo $number_count
        exit 0
    else 
        # echo "recutrion and directory"
        a=$(find "$2" 2>/dev/null)

        if [ $? -ne 0 ]; then
            echo "Error: Some directories are not accessible"
            exit 7
        fi
        number_count=$(find $2 -mindepth 1 -not -name '.' -not -name '..'  | wc -l)
        echo $number_count
        exit 0
    fi
fi




# if [ -d $1 ]; then
#  echo "it's directory"

# else
#  echo "smth else"

# fi

# if [ $1 != "-R" ] && [ -d "$2" ]; then
#     echo "re"
# else
#     echo "sdf"
# fi