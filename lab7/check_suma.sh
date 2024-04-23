#!/bin/bash

wrong_arguments=(
    ''
    '-a numbers 5'
    '-a numbers 0' # nr. kolumny > 0
    '-a numbers -1'
    '-a not_read_perm' #not permissions
    '-a directory' #not file
    '-a not_numbers 2' #not numbers
    '-a not_numbers 1 2' #numbers and not numbers
    '-a numbers f' #not correct argument
    '-a not_exists_file' #file does not exist
    'numbers 5'
    'numbers 0' # nr. kolumny > 0
    'numbers -1'
    'not_read_perm' #not permissions
    'directory' #not file
    'not_numbers 2' #not numbers
    'not_numbers 1 2' #numbers and not numbers
    'numbers f' #not correct argument
    'not_exists_file' #file does not exist
)

correct_arguments=(
    'numbers 1 2'
    '-a numbers'
    '-a numbers 1 2'
    'numbers'
)

echo -e "\n\nWRONG TESTS\n\n"
for ((i=0; i<${#wrong_arguments[@]}; i++)); do 
    echo '----------------------------'
    echo "executing ${wrong_arguments[i]}"
    eval "./suma.sh ${wrong_arguments[i]}"
done

echo -e "\n\nCORRECT TESTS\n\n"
for ((i=0; i<${#correct_arguments[@]}; i++)); do 
    echo '----------------------------'
    echo "executing ${correct_arguments[i]}"
    eval "./suma.sh ${correct_arguments[i]}"
done
