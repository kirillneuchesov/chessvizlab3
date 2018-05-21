{\rtf1\ansi\deff0\nouicompat{\fonttbl{\f0\fnil\fcharset0 Courier New;}}
{\*\generator Riched20 10.0.16299}\viewkind4\uc1 
\pard\f0\fs22\lang1033 CC=gcc\par
CFLAGS=-Wall -Werror -c\par
FLAGS =  -Wall -Werror -std=c99\par
\par
SRC=src/\par
BUILD=build/\par
BIN=bin/\par
TEST=test/\par
THIRD=thirdparty/\par
\par
objects=$(BUILD)main.o $(BUILD)board.o $(BUILD)board_read.o \par
sources=$(SRC)main.c $(SRC)board.c $(SRC)board_read.c \par
EXE=$(BIN)main\par
\par
.PHONY: all clean\par
\par
all: bin build $(EXE)\par
\par
$(EXE): $(objects)\par
\tab $(CC) $(objects) -o $@\par
\par
$(BIN)chess: $(BUILD)main.o \par

\pard\tab $(CXX) $(FLAGS) $(BUILD)main.o -o $@\par

\pard\par
$(BUILD)main.o: $(SRC)main.c \par
\tab $(CC) $(CFLAGS) $(SRC)main.c -o $@\par
\tab\par
$(BUILD)board_read.o: $(SRC)board_read.c $(SRC)board_read.h \par
\tab $(CC) $(CFLAGS) $(SRC)board_read.c -o $@\par
\tab\par
$(BUILD)board.o: $(SRC)board.c $(SRC)board.h\par
\tab $(CC) $(CFLAGS) $(SRC)board.c -o $@\par
\par
$(BIN)chess_test:$(BUILD)main_test.o \par

\pard\tab $(CC) $(FLAGS) $(BUILD)main_test.o -o $@\par

\pard\par
$(BUILD)main_test.o: $(TEST)test.c $(THIRD)ctest.h $(SRC)board.h $(SRC)board_read.h\par
\tab $(CC) $(CFLAGS) -I thirdparty -I src -c test/main_test.o -o $(BUILD)main_test.o $@\par
\par
bin:\par
\tab mkdir bin\par
build:\par
\tab mkdir build\par
clean:\par
\tab -rm -rf build bin\par
}
 