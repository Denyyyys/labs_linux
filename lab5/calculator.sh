#!/bin/bash

# # check_if_operator() {
# #   if [[ $1 =~ ^[+-/*]$ ]]; then
# #     return 0;
# #   else
# #     return 1;
# #   fi
# # }

# # check_syntax_arguments() {
# #   args=("$@")
# #   first_argument="${args[0]}"
# #   if check_if_operator "$first_argument"; then
# #     echo "Error: Can't start by operator: ${first_argument}"
# #     exit 1
# #   fi

# #   for ((i = 0; i < $#; i++)); do
# #     curr_is_operator=1 # jest liczba
# #     next_index=$((i + 1))
# #     if [[ ! "${args[i]}" =~ ^[0-9]+$ && ! "${args[i]}" =~ ^[+-/*]$ && ! "${args[i]}" =~ ^\([0-9]+$ && ! "${args[i]}" =~ ^[0-9]+\)$ ]]; then
# #       echo "Error: You provided a bad argument: ${args[i]}"
# #       exit 1
# #     fi

# #     if check_if_operator "${args[i]}"; then
# #       curr_is_operator=0 # jest operatorem
# #     fi
    
# #     if (( next_index < ${#args[@]} )); then
# #         next_arg="${args[next_index]}"
# #         if [[ ! "${args[next_index]}" =~ ^[0-9]+$ && ! "${args[next_index]}" =~ ^[+-/*]$ && ! "${args[next_index]}" =~ ^\([0-9]+$ && ! "${args[next_index]}" =~ ^[0-9]+\)$ ]]; then
# #           echo "Error: You provided a bad argument: ${args[next_index]}"
# #           exit 1
# #         fi
# #     else
# #         next_arg=""
# #     fi

# #     if [ $curr_is_operator -eq 0 ]; then
# #       # echo "${args[i]}"
# #       # echo $next_arg
# #       if [ "$next_arg" = "" ]; then
# #         echo "Error: Statement can't end with operator!"
# #         exit 1
# #       else
# #         if check_if_operator "${args[next_index]}"; then
# #           echo "Error: You have two operators along!"
# #           exit 1
# #         fi
# #       fi
# #     else 
# #       # argument to liczba
# #       if [ "$next_arg" != "" ] && ! check_if_operator "${args[next_index]}"; then
# #         echo "Error: You have two numbers along!"
# #         exit 1
# #       fi
# #     fi

# #   done
# # }

# # check_brackets() {
# #  opened_brackets=0
# #  closed_brackets=0
# #  while [ $1 ]
# #  do
# #   # otwarty nawias, po którym są tylko liczby
# #   if [[ $1 =~ ^\([0-9]+$ ]]
# #   then
# #    ((opened_brackets += 1))
# #   fi
   
# #   # zamknięty nawias, przed którym są tylko liczby
# #   if [[ $1 =~ ^[0-9]+\)$ ]]
# #   then
# #    ((closed_brackets += 1))
# #   fi

# #   # check if is only nawias; if nawias with not number; contains not only number; is any symbol before (; is any symbol after );
# #   if [[ $1 = '(' ]]
# #   then
# #    echo "Error: Jest otwarty nawias, po ktorym nie występuje liczba!"
# #    exit 1
# #   fi

# #   if [[ $1 = ')' ]]
# #   then
# #    echo "Error: Jest zamknięty nawias, przed ktorym nie występuje liczba!"
# #    exit 2
  
# #   fi  
  
# #   if [ $closed_brackets -gt $opened_brackets ]
# #   then
# #    echo "Error: W twoium wyrażeniu jest niezamknięty nawias!"
# #    exit 1
# #   fi

# #   # wskazuje, jaki jest poziom zagnieżdżenia
# #   curr_opened_brackets=`expr $opened_brackets - $closed_brackets`
# #   if [ "$curr_opened_brackets" -ge 2 ]
# #   then
# #    echo "Error: W twoim wyrażeniu występuje więcej niż jeden poziom nawiasów!"
# #    exit 2
# #   fi

# #   shift
# #  done
 
# #  if [ $closed_brackets -lt $opened_brackets ]
# #     then
# #   echo "Error: W twoim wyrażeniu jest za dużo otwartych nawiasów!"
# #   exit 4
# #  fi
# # }


# # evaluate() {
# #   # only when everything is correct
# #   # a="1 + 2 + \(3 '*' 9\)"
# #   a='(1 + 9)'
# #   a="${a:1:-1}"
# #   echo $a
# #   readarray -t arrayOfBracketsExpr <<< echo "1 + \(3 + 3\) - \(9 + 10\)" | grep -oP '\(.*?\)'

# #   # a=$*
# #   # echo `expr $a`
# # }





# # # check_syntax_arguments "$@"
# # # check_brackets "$@"
# # evaluate $*
# # # echo `expr "$a"`
# #!/bin/bash

# # Function to evaluate an arithmetic expression
# # evaluate_expression() {
# #     expr "$1"
# # }

# # Function to process the string
# # process_string() {
# #     # Find the first occurrence of expression within brackets
    
# #     first_match=$(echo "$1" | grep -oP '\(.*?\)' | head -n 1)
# #     first_match=\\${first_match}
# #     echo $first_match
# #     expression=${first_match:2:-2}
# #     echo $expression
# #     value=`expr $expression`
# #     echo $value
# #     echo "$1" | sed "s/$first_match/1/"
# # }

# # # Main
# # input_string="1 + \(3 + 3\) - \(9 + 10\)"
# # process_string "$input_string"
# # # echo "$output_string"

# process_string() {
#     # Find the first occurrence of expression within brackets
#     echo "$1"
#     # first_match=$(echo "$1" | grep -oP '\(.*?\)' | head -n 1)
#     # $first_match=\\\${first_match}
#     # echo $first_match
#     # expression=${first_match:2:-2}  # Remove parentheses

#     # value=$(expr "$expression")
#     # echo $value
#     # echo $first_match
#     # echo "$1" | sed "s[\\\(3 + 3\\\)[PIZZAS["

#     # echo "$1" | sed "s[\\${first_match}[${value}["
# }

# # Main
# # input_string="1 + \(3 + 3\) - \(9 + 10\)"
# # process_string "$input_string"
# process_string "$#"
process_string() {

    whole_expr=$*
    first_match="$(echo $whole_expr | grep -oP '\(.*?\)' | head -n 1)"
    # echo $first_match

    # if [[ -z $first_match ]]; then
      



    while [[ ! -z $first_match ]]; do
      # echo sd23f
      # echo $first_match
      expression=${first_match:1:-1}
      # echo $expression
      # expression="${expression//\*/\\*}"
      
      value=`expr $expression`
      # echo $value
      whole_expr=$(echo "$whole_expr" | sed "s|$first_match|$value|")


      echo --------------------
      echo $whole_expr
      echo --------------------
      first_match="$(echo $whole_expr | grep -oP '\(.*?\)' | head -n 1)"

    done

    a=`expr $whole_expr`
    echo "Your expression is the same as: $whole_expr"
    echo "Result is: $a"
    
}

process_string "$@"
