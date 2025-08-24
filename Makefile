TARGET = bin/dbview
SRC = $(wildcard src/*.c)
OBJ = $(patsubst src/%.c, obj/%.o, $(SRC))

# Default target
run: clean default
	./$(TARGET) 
	
default: dirs $(TARGET)

# Ensure needed directories exist
dirs:
	mkdir -p obj bin

# Clean build artifacts
clean:
	rm -f obj/*.o
	rm -f bin/*

# Clean database files (optional)
clean-db:
	rm -f *.db

# Link objects to create the final binary
$(TARGET): $(OBJ)
	gcc -o $@ $^

# Compile .c files to .o files
obj/%.o : src/%.c
	gcc -c $< -o $@ -Iinclude


