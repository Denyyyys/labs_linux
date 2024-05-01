all: rlin

.PHONY: clean
CC = gcc
LDFLAGS = -lm
CFLAGS  = -Iheaders

rlin: rlin.o src/s.o src/input.o 
	$(CC) $(CFLAGS) -o rlin $(LDFLAGS) rlin.o src/s.o src/input.o 

rlin.o: rlin.c headers/rlin.h
	$(CC) $(CFLAGS) -c rlin.c -o rlin.o 

src/s.o: src/s.c headers/rlin.h
	$(CC) $(CFLAGS) -c src/s.c -o src/s.o 

src/input.o: src/input.c headers/rlin.h
	$(CC) $(CFLAGS) -c src/input.c -o src/input.o 

clean:
	find . -type f -name "*.o" -exec rm -f {} +
