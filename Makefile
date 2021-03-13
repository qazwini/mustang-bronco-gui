SWIFTC = swiftc
SWIFT = swift

all: main

main: mb.swift vc.swift main.swift
	$(SWIFTC) $^ -o $@

test: mb.swift tests/main.swift
	$(SWIFTC) $^ -o mb_test

.PHONY: clean
clean:
	rm -rvf main mb_test
