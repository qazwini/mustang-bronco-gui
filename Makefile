SWIFT = swiftc

all: main

main: main.swift
	$(SWIFT) $^ -o $@

.PHONY: clean
clean:
	rm -f main
