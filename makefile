SHELL := /bin/bash

MD := $(wildcard *.p.md)
MD2HTML := $(patsubst %.p.md,%.html,$(MD))

pandocarc := -f markdown+autolink_bare_uris-fancy_lists -S --toc --toc-depth=6 --normalize -s

all: $(MD2HTML)

%.html: %.p.md
	echo -e "---\n---\n" > $@
	pandoc $(pandocarc) $< >> $@

clean:
	rm -f $(MD2HTML)
