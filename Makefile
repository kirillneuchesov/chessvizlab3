CC=gcc -lm
CFLAGS= -lm -Wall -Werror -c 
FLAGS = -lm -Wall -Werror 

SRC=src/
BUILD=build/
BIN=bin/
TEST=test/
THIRD=thirdparty/

objects=$(BUILD)main.o $(BUILD)board.o $(BUILD)board_read.o 
sources=$(SRC)main.c $(SRC)board.c $(SRC)board_read.c 
EXE=$(BIN)main

.PHONY: all clean

all: bin build test default $(EXE)

test: bin/chess_test

default: bin/chess

$(EXE): $(objects)
	$(CC) $(objects) -o $@

$(BIN)chess: $(BUILD)main.o
	$(CC) $(FLAGS) $(BUILD)main.o -o $(BIN)chess 

$(BUILD)main.o: $(SRC)main.c 
	$(CC) $(CFLAGS) $(SRC)main.c -o $(BUILD)main.o 

$(BUILD)board_read.o: $(SRC)board_read.c $(SRC)board_read.h 
	$(CC) $(CFLAGS) $(SRC)board_read.c -o $(BUILD)board_read.o

$(BUILD)board.o: $(SRC)board.c $(SRC)board.h
	$(CC) $(CFLAGS) $(SRC)board.c -o $(BUILD)board.o 

$(BUILD)main_test.o: $(TEST)test.c
	$(CC) $(CFLAGS) -I thirdparty -I src $(TEST)test.c -o $(BUILD)main_test.o

$(BIN)chess_test:$(BUILD)main_test.o 
	$(CC) $(FLAGS) $(BUILD)main_test.o -o $(BIN)chess_test

bin:
	mkdir bin
build:
	mkdir build
clean:
	-rm -rf build bin
