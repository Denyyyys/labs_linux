.PHONY: clean

# define in main Makefile
# INC = ../headers
# CFLAGS = -I$(INC)
# LDFLAGS = -lm

all: libusux.a

libusux.a: delta.o pierw.o
	ar -rv $@ $^

pierw.o: $(INC)/fun.h

delta.o: $(INC)/fun.h

# pierw.o: $(INC)/fun.h
# 	$(CC) $(CFLAGS) -c -o $@ pierw.c   

# delta.o: $(INC)/fun.h
# 	$(CC) $(CFLAGS) -c -o $@ delta.c

clean:
	rm -f *.o