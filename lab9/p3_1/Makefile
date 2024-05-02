all: prog

.PHONY: clean

CC = gcc
LDFLAGS = -lm
INC = ./include
CFLAGS  = -O3 -g -I$(INC) -DZESPOLONE

prog: pierw.o rkw.o delta.o
#	 $(CC) -o prog pierw.o rkw.o delta.o $(LDFLAGS)
	$(CC) -o $@ $^ $(LDFLAGS)

# pierw.o: pierw.c $(INC)/fun.h
# 	$(CC) $(CFLAGS) -c pierw.c 

# rkw.o: rkw.c $(INC)/rkw.h
# 	$(CC) $(CFLAGS) -c rkw.c 

# delta.o: delta.c $(INC)/fun.h
# 	$(CC) -$(CFLAGS) -c delta.c 

pierw.o: $(INC)/fun.h

rkw.o: $(INC)/rkw.h

delta.o: $(INC)/fun.h

clean:
	rm -f *.o