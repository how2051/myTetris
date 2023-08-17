CC=g++
CFLAGS=-c -DLINUX -I. -LSDL/lib
LDFLAGS=-lSDL -lSDL_gfx
SOURCES=Main.cpp Game.cpp Board.cpp IO.cpp Pieces.cpp
OBJECTS=$(addprefix build/,$(SOURCES:.cpp=.o))
EXECUTABLE=tetris

all: $(SOURCES) $(EXECUTABLE)

$(EXECUTABLE): $(OBJECTS)
	$(CC) $(OBJECTS) -o $@ $(LDFLAGS)

build/%.o: %.cpp | build
	$(CC) $(CFLAGS) $< -o $@ $(LDFLAGS)

build:
	mkdir -p build

clean:
	-rm -rf build $(EXECUTABLE)

# g++ Main.o Game.o Board.o IO.o Pieces.o -o tetris -lSDL -lSDL_gfx
