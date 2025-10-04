# Compiler and flags
CC = gcc
CFLAGS = -Wall -g -O2 -std=c99

# Linker flags for shared memory and pthreads
LDFLAGS = -lrt -lpthread

# Executable names
TARGETS = setter getter

# Default target: build all executables
all: $(TARGETS)

# Rule to build the setter
setter: setter.c shared_kv.h
	$(CC) $(CFLAGS) -o setter setter.c $(LDFLAGS)

# Rule to build the getter
getter: getter.c shared_kv.h
	$(CC) $(CFLAGS) -o getter getter.c $(LDFLAGS)

# Rule to clean up build files
clean:
	./setter --destroy
	rm -f $(TARGETS)

# Phony targets
.PHONY: all clean