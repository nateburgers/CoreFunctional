CC = clang
SOURCES=RFSCoreFunctional.m RFSCoreFunctionalTest.m
FRAMEWORKS:= -framework Foundation
LIBRARIES:= -lobjc
CFLAGS= -fobjc-arc -Wall -Werror -g -c -o
TESTFLAG= -DTESTING=true
LDFLAGS= $(LIBRARIES) $(FRAMEWORKS)
OUT= RFSCoreFunctional.o RFSCoreFunctionalTest.o

all: $(SOURCES) $(OUT)

test: $(OUT)
	$(CC) $(LDFLAGS) -o $@ $(OUT)

clean:
	rm -rf *.o; rm ./test

%.o : %.m
	$(CC) $(TESTFLAG) $(CFLAGS) $@ $^

