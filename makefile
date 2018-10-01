SHELL := /bin/bash

MD := $(wildcard *.p.md)
MD2HTML := $(patsubst %.p.md,%.html,$(MD))

pandocarc := -f markdown+autolink_bare_uris-fancy_lists --toc --toc-depth=6 -s

all: $(MD2HTML)

%.html: %.p.md
	echo -e "---\n---\n" > $@
	pandoc $(pandocarc) $< >> $@

Clean:
	rm -f $(MD2HTML)

print-%:
	$(info $* = $($*))
