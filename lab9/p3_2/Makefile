all: prog

.PHONY: clean

CC = gcc
LDFLAGS = -lm
INC = ./include
CFLAGS  = -g -I$(INC) -DZESPOLONE

prog: rkw.o libusux.a
#	$(CC) -o prog rkw.o libusux.a $(CFLAGS) $(LDFLAGS)
	$(CC) -o prog $^ $(LDFLAGS)

libusux.a: delta.o pierw.o
#	ar -rv libusux.a delta.o pierw.o
	ar -rv $@ $^

# pierw.o: pierw.c $(INC)/fun.h
# 	$(CC) $(CFLAGS) -c pierw.c 

# rkw.o: rkw.c $(INC)/rkw.h
# 	$(CC) $(CFLAGS) -c rkw.c

# delta.o: delta.c $(INC)/fun.h
# 	$(CC) $(CFLAGS) -c delta.c

pierw.o: $(INC)/fun.h

rkw.o: $(INC)/rkw.h

delta.o: $(INC)/fun.h

clean:
	rm -f *.o