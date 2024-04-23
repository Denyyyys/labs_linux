# if [ $1 -eq '(' ]
#   then
#    $open_brackets +=1   
#   fi

# echo "error brackets"

# my_arr=(
#     "ls;"
#     "echo time:; date"
# )

# for command in ${my_arr[@]}; do
#     echo "$command"


# done

# for ((i=0;i<${#my_arr[@]}; i++)) do 
#     echo "executing ${my_arr[i]}"

# done

wrong_brackets=(
    '\(1 + 2\) + \(3'
    '1\) + \(2'
    "2 + \(3 + \(9 - 9\) - 4\)"

)

wrong_arguments=(
    '1\( + 2\)'
    '\)1 + \(2'
    '\(1 + \)2'
    "- 2 + \(23 '*' 2"
    "2 + \(23 '*' 2 -"
    "2 + \(23 '*' 2 -  "
    "2 + 23\(\) '*' 2 -  "
)

echo -e "\n\nBRACKETS TEST\n\n"
for ((i=0; i<${#wrong_brackets[@]}; i++)); do 
    echo '----------------------------'
    echo "executing ${wrong_brackets[i]}"
    eval "./calculator.sh ${wrong_brackets[i]}"
done

echo -e "\n\nARGUMENTS TEST\n\n"
for ((i=0; i<${#wrong_arguments[@]}; i++)); do 
    echo '----------------------------'
    echo "executing ${wrong_arguments[i]}"
    eval "./calculator.sh ${wrong_arguments[i]}"
done


#./calculator.sh 1 + 2 / 3 + \(9 + 9\) - \(10 + 1\) - \(9 / 9\)
# zero check
