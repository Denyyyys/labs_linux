#!/bin/bash

check_if_column_has_only_numbers(){
    awk -v col=$2 'BEGIN { is_integer = 1 }
    
    NR > 1 {
        if ($col !~ /^[-]?[0-9]+$/) {
            is_integer = 0;
            exit
        }
    }
    END {
        if (is_integer == 1) {
            exit 0
        } else {
            exit 1
        }
    }' "$1"
}

print_all=false
result_array=()

if [ $# -eq 0 ]; then
    echo "You should provide at least path to the file!"
    exit 1
fi

if [ "$1" = '-a' ]; then
    print_all=true
fi

if [ "$print_all" = true ]; then
    # -a
    if [ $# -lt 2 ]; then
        echo "You should provide at least path to the file!"
        exit 1
    fi    
    if [[ ! -f $2 ]]; then
        echo "$2 is not the file or does not exist!"
        exit 1
    fi

    if [[ ! -r $2 ]]; then
        echo "You don't have read permission to the file $2!"
        exit 1
    fi
    num_columns=$(awk '{print NF; exit}' "$2")
    for ((i = 3; i <= $#; i++)); do
        if [[ "${!i}" -gt $num_columns || "${!i}" -lt 1 ]]; then
            if ! [[ ${!i} =~ ^[-]?[0-9]+$ ]]; then
                echo "Column should be the number! Provided: ${!i}"
                exit 1
            fi
            echo "Column number should be bigger than 0 and less than $num_columns. Provided: ${!i}"
            exit 1
        fi
    done

    if [ $# -eq 2 ]; then
        # -a numbers
        for ((i=1; i<=$num_columns; i++)); do        
            check_if_column_has_only_numbers "$2" "$i"
            result=$?   
            if [ $result -eq 1 ]; then
                echo "Column $i in file $2 contains not only integers!"
                exit 1
            fi
             # result_array+=($(awk -v col="$i" '{sum += $col} END {print sum}' "$2"))
        done
        result_array=$(awk '{
            s=0  
            for(i = 1; i <= NF; ++i) { 
                s += $i
            };
            print s;
        }' $2)
    else
        # -a numbers 1 2
        for number in "${@:3}"; do
            check_if_column_has_only_numbers "$2" "$number"
            result=$?   
            if [ $result -eq 1 ]; then
                echo "Column $number in file $2 contains not only integers!"
                exit 1
            fi
            # result_array+=($(awk -v col="$number" '{sum += $col} END {print sum}' "$2"))

        done
        columns="${@:3}"
        result_array=$(awk -v col="$columns" 'BEGIN {
            split(col, colarr, " ");
        } 
        {
            s = 0;
            for(i = 1; i <= length(colarr); ++i){
                s += $colarr[i]
            };
            print s;
        }
        ' "$2")
    fi

    sum=0
    for num in ${result_array[@]}; do
        ((sum += num))
        echo $num
    done
    # echo $result_array
    # for element in ${result_array[@]}; do
    #     echo $element
    # done
    # for element in "${result_array[@]}"; do
    #     echo $element
    # done

    echo "Sum of all columns: $sum"
else
    # without option -a
    if [[ ! -f $1 ]]; then
        echo "$1 is not the file or does not exist!"
        exit 1
    fi
    if [[ ! -r $1 ]]; then
        echo "You don't have read permission to the file $1!"
        exit 1
    fi

    num_columns=$(awk '{print NF; exit}' "$1")
    for ((i = 2; i <= $#; i++)); do
        if [[ "${!i}" -gt $num_columns || "${!i}" -lt 1 ]]; then
            if ! [[ ${!i} =~ ^[-]?[0-9]+$ ]]; then
                echo "Column should be the number! Provided: ${!i}"
                exit 1
            fi
            echo "Column number should be bigger than 0 and less than $num_columns. Provided: ${!i}"
            exit 1
        fi
    done
    if [ $# -eq 1 ]; then
        # numbers
        for ((i=1; i<=$num_columns; i++)); do        
            check_if_column_has_only_numbers "$1" "$i"
            result=$?   
            if [ $result -eq 1 ]; then
                # echo "Column contains non-integer values."
                echo "Column $i in file $1 contains not only integers!"
                exit 1
            fi

            # result_array+=($(awk -v col="$i" '{sum += $col} END {print sum}' "$1"))
        done
        result_array=$(awk '{
            s=0  
            for(i = 1; i <= NF; ++i) { 
                s += $i
            };
            print s;
        }' $1)
    else
        #numbers 1 2
        for number in "${@:2}"; do
            # echo "$number"
            check_if_column_has_only_numbers "$1" "$number"
            result=$?   
            if [ $result -eq 1 ]; then
                echo "Column $number in file $1 contains not only integers!"
                exit 1
            fi
            # result_array+=($(awk -v col="$number" '{sum += $col} END {print sum}' "$1"))
        done
        columns="${@:2}"
        result_array=$(awk -v col="$columns" 'BEGIN {
            split(col, colarr, " ");
        } 
        {
            s = 0;
            for(i = 1; i <= length(colarr); ++i){
                s += $colarr[i]
            };
            print s;
        }
        ' "$1")
    fi
    
    for element in "${result_array[@]}"; do
        echo "$element"
    done
fi