# Build iac tools container
build:
    docker build -t iac-tools .

# Show image size
size: build
    @echo "Image sizes:"
    @docker images | grep -E "(iac-tools|python.*3.14)" | grep -v none

# Exec container with bash
bash: build
    docker run --rm -it iac-tools bash

# List available commands
help:
    @just --list
