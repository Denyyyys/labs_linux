# include ../Makefile

# define in main Makefile
# INC = ../headers
# CFLAGS = -I$(INC)


.PHONY: clean

all: prog2

prog2: input.o rlin.o
	$(CC) $(CFLAGS) -o $@ $^ 

input.o: $(INC)/rlin.h

rlin.o: $(INC)/rlin.h

clean:
	rm -f *.o