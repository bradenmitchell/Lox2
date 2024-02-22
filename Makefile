# Directories
SRC_DIR   = src
BUILD_DIR = build

# Compiler
CC = clang

# Files
EXE  = clox
TARGET    = $(BUILD_DIR)/$(EXE)
SRC_FILES = $(wildcard $(SRC_DIR)/*.c)
OBJ_FILES = $(addprefix $(BUILD_DIR)/, $(notdir $(SRC_FILES:.c=.o)))

# Flags
WFLAGS = -Wall -Wextra -Wshadow
CFLAGS = $(WFLAGS) -Og -g

# Phonies
.PHONY: clean all

all: $(TARGET)

clean:
	rm -rf $(BUILD_DIR)

# Build (linking)
$(TARGET): $(OBJ_FILES)
	@mkdir -p $(BUILD_DIR)
	$(CC) $(CFLAGS) $(OBJ_FILES) -o $(TARGET)

# Compilation
$(BUILD_DIR)/%.o: $(SRC_DIR)/%.c
	@mkdir -p $(BUILD_DIR)
	$(CC) $(CFLAGS) -c -o $@ $^
