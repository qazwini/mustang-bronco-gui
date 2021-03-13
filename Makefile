SWIFT = swiftc

all: app

app: app.swift
	$(SWIFT) $^ -o $@

.PHONY: clean
clean:
	rm -f app
