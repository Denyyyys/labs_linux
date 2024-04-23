#!/bin/bash

wront_arguments=(
    'temp.txt'
    'not_exist_file'
    '-R'
    '-r'
    '-R temp.txt'
    '-R temp.txt SOME'
    '-R dirr sfs'
    '-R dirr -R'
    '-R dirr dirr'
    '-R dirr f somethingselse'
    '-R text.txt f'
    '-R f'
)
correct_arguments=(
    'dirr'
    '.'
    '-R dirr'
    '-R dirr f'
    '-R dirr d'
    'dirr f'
    
)

echo -e "\n\nWRONG TESTS\n\n"
for ((i=0; i<${#wront_arguments[@]}; i++)); do 
    echo '----------------------------'
    echo "executing ${wront_arguments[i]}"
    eval "./licz.sh ${wront_arguments[i]}"
done

echo -e "\n\nCORRECT TESTS\n\n"
for ((i=0; i<${#correct_arguments[@]}; i++)); do 
    echo '----------------------------'
    echo "executing ${correct_arguments[i]}"
    eval "./licz.sh ${correct_arguments[i]}"
done