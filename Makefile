PHONY: all

# File paths
SRC_DIR := ./
BUILD_DIR := ./build
OBJ_DIR := $(BUILD_DIR)/obj

# Compilation flags
CC := gcc
LD := gcc
CFLAGS := -Wall  -g #-static

## used headers  file path
INCLUDE_PATH := ./include
## need libs, add at here
LIBS := ssl crypto
## used include librarys file path
LIBRARY_PATH := ./lib/

## get all include path
CFLAGS  += $(foreach dir, $(INCLUDE_PATH), -I$(dir))
## get all library path
LDFLAGS += $(foreach lib, $(LIBRARY_PATH), -L$(lib))
## get all librarys
LDFLAGS += $(foreach lib, $(LIBS), -l$(lib))


# Files to be compiled
SRCS := $(wildcard $(SRC_DIR)/*.c)
OBJS := $(SRCS:$(SRC_DIR)/%.c=$(OBJ_DIR)/%.o)
BUILD := $(OBJS:$(OBJ_DIR)/%.o=$(BUILD_DIR)/%)

# Don't remove *.o files automatically
.SECONDARY: $(OBJS)

all: $(BUILD)

# Compile each *.c file as *.o files
$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c 
	@echo + CC $<
	@mkdir -p $(OBJ_DIR)
	@$(CC) $(CFLAGS) -c -o $@ $<

# Link each *.o file as executable files
$(BUILD_DIR)/%: $(OBJ_DIR)/%.o
	@echo + LD $@
	@mkdir -p $(BUILD_DIR)
	@$(LD) $(CFLAGS)  -o $@ $< $(LDFLAGS) -lpthread -ldl 

.PHONY: all clean

clean:
	rm -rf $(BUILD_DIR)

# ————————————————
# SRC=$(wildcard *.c)
# OBJ=$(SRC:%.c=%.o)
# BIN=$(OBJ:%.o=%)

# CC=gcc
# CFLAGS=-Wall -g -I./include -L./lib -lssl -lcrypto
# all:$(BIN)

# $(BIN):%:%.o
# $(CC) $(CFLAGS) $^ -o $@
# $(OBJ):%.o:%.c
# $(CC) $(CFLAGS) $^ -o $@

# clean:
# rm $(OBJ) $(BIN)