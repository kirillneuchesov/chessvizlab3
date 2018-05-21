CC=gcc
CFLAGS=-Wall -Werror -c
FLAGS =  -Wall -Werror -std=c99

SRC=src/
BUILD=build/
BIN=bin/
TEST=test/
THIRD=thirdparty/

objects=$(BUILD)main.o $(BUILD)board.o $(BUILD)board_read.o 
sources=$(SRC)main.c $(SRC)board.c $(SRC)board_read.c 
EXE=$(BIN)main

.PHONY: all clean

all: bin build $(EXE)

$(EXE): $(objects)
	$(CC) $(objects) -o $@

$(BUILD)main.o: $(SRC)main.c 
	$(CC) $(CFLAGS) $(SRC)main.c -o $@
	
$(BUILD)board_read.o: $(SRC)board_read.c $(SRC)board_read.h 
	$(CC) $(CFLAGS) $(SRC)board_read.c -o $@
	
$(BUILD)board.o: $(SRC)board.c $(SRC)board.h
	$(CC) $(CFLAGS) $(SRC)board.c -o $@

$(BIN)chess_test:$(BUILD)main_test.o 
	$(CC) $(FLAGS) $(BUILD)main_test.o -o $(BIN)chess_test

$(BUILD)main_test.o: $(TEST)test.c $(THIRD)ctest.h $(SRC)board.h $(SRC)board_read.h
	$(CC) $(CFLAGS) -I thirdparty -I src -c test/main_test.o -o $(BUILD)main_test.o $@

bin:
	mkdir bin
build:
	mkdir build
clean:
	-rm -rf build bin