SWIFT = swiftc

all: main

main: mb.swift vc.swift main.swift
	$(SWIFT) $^ -o $@

.PHONY: clean
clean:
	rm -f main
