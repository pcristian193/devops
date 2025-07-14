SHELL := /bin/bash

# Detect OS
UNAME_S := $(shell uname -s)

ifeq ($(UNAME_S),Linux)
    OS := linux
endif
ifeq ($(UNAME_S),Darwin)
    OS := mac
endif
ifeq ($(OS),)
    ifneq (,$(findstring MINGW,$(UNAME_S)))
        OS := windows
    endif
    ifneq (,$(findstring MSYS,$(UNAME_S)))
        OS := windows
    endif
endif

# Default target
.PHONY: run
run:
	@echo "Detected OS: $(OS)"
	@bash exec.sh

