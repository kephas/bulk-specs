names = $(basename $(wildcard draft*.xml))
html = $(addsuffix .html, $(names))
txt = $(addsuffix .txt, $(names))

html: $(html)
txt: $(txt)

%.html: %.xml
	xml2rfc $< $@

%.txt: %.xml
	xml2rfc $< $@

clean:
	rm -f $(html) $(txt)

.PHONY: html txt