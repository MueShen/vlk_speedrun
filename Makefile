CC:=g++
CFLAGS:=-Wall -Wextra -std=c++23
LIBS:=-lglfw -lvulkan -ldl -lpthread -lX11 -lXxf86vm -lXrandr -lXi

SRC:=$(wildcard src/*.cpp)
OBJ:=$(SRC:.cpp=.o)


all: $(OBJ) shaders
	$(CC) $(CFLAGS) $(OBJ) -o bin/core $(LIBS) 

%.o: %.c
	$(CC) $(CFLAGS) -c $@ -o $<

.PHONY: clean

clean:
	@rm -rfv $(OBJ) executable

shaders:
	@rm -rfv bin/shaders/*
	@glslc shadersGLSL/shader.frag -o src/shaders/frag.spv
	@glslc shadersGLSL/shader.vert -o src/shaders/vert.spv
	@echo "Shaders should be  compiled now"
