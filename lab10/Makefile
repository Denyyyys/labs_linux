.PHONY: clean install

export CC = gcc
export INC = ../headers
export CFLAGS = -g -I$(INC) -DZESPOLONE
all:
	$(MAKE) -C lib
	$(MAKE) -C src1
	$(MAKE) -C src2

clean:
	$(MAKE) -C lib clean
	$(MAKE) -C src1 clean
	$(MAKE) -C src2 clean
#	cd src2; $(MAKE) clean

install:
	mkdir -p bin; cd bin; \
	cp ../src2/prog2 prog2; \
	cp ../src1/prog1 prog1;

#	mv ../src2/prog2 ./prog2 