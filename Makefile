# Compiler Flags
CC = emcc
CCFLAGS += -Wall -Wextra 
UNAME := $(shell uname)
ifeq ($(UNAME), Darwin)
LDFLAGS = -framework OpenGL -framework GLUT
else
# add to compile without glDrawPixels:  -s ERROR_ON_UNDEFINED_SYMBOLS=0
# add to show full linking command:     -s LLD_REPORT_UNDEFINED
LDFLAGS = -lglut -lGL
endif

all: play.js

play.js: chip8.c play.c
	$(CC) $(CCFLAGS) chip8.c play.c -o $@ $(LDFLAGS)

clean:
	rm -f play.js play.wasm
