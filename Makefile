SWIFT = swiftc

all: main

main: vc.swift main.swift
	$(SWIFT) $^ -o $@

.PHONY: clean
clean:
	rm -f main
