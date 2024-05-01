#!/bin/bash
if [ $# -eq 0 ]; then
    echo "You should provide at least path to the directory of project!"
    exit 1
fi
if [[ ! -d $1 ]]; then
    echo "$1 should be a directory"
    exit 1
fi
cd $1

# wszystkie wspomnienia funkcji main
main_all=$(grep -rEl --include \*.c "main\s*\(")
if [[ -z $main_all ]]; then
    echo "Not source file with function main was found"
    exit 1
fi

# tylko pierwse
main=$(echo $main_all | head -1)
if [ "$main_all" != "$main" ]; then
    echo "Function main should be only in one source file! It was in: "$main_all""
    exit 1
fi


# main no extension
main_n_extens=$(echo $main | sed -e "s/.c$//")
echo "all: $main_n_extens" > Makefile
echo -e "\n.PHONY: clean" >> Makefile
echo "CC = gcc" >> Makefile
echo "LDFLAGS = -lm" >> Makefile
echo -e "CFLAGS  = -Iheaders\n" >> Makefile
echo -n "$main_n_extens: " >> Makefile

# find every .c file, delete ./ in the beggining, delete .c in the end
files_n_extens=$(find -type f -name "*.c" | sed -e "s/^.\///" | sed -e "s/.c$//")

for file in $files_n_extens; do
    echo -n "$file.o " >> Makefile
done
echo "" >> Makefile
echo -ne '\t$(CC) $(CFLAGS) -o' "$main_n_extens" '$(LDFLAGS) ' >> Makefile

for file in $files_n_extens;do
    echo -n "$file.o " >> Makefile
done
echo -e "\n" >> Makefile

for file in $files_n_extens; do
    echo -n "$file.o: $file.c " >> Makefile
    echo -n $(grep -o '#include ".*"' $file.c  | sed -e "s|#include |headers/|" | sed "s/\"//g") >> Makefile
    echo "" >> Makefile
    echo -e '\t$(CC) $(CFLAGS) -c' $file.c "-o $file.o" '\n' >> Makefile
done

echo -e "clean:\n\tfind . -type f -name \"*.o\" -exec rm -f {} +" >> Makefile
