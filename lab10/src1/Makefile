.PHONY: clean

# define in main Makefile
# INC = ../headers
# CFLAGS = -g -I$(INC)

LIBS = -lusux -lm

all: prog1

prog1: rkw.o ../lib/libusux.a
	$(CC) $(CFLAGS) -o $@ $^ -L../lib $(LIBS)

rkw.o: $(INC)/rkw.h

clean:
	rm -f *.o