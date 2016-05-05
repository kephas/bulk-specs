names = $(basename $(wildcard draft*.xml))
html = $(addsuffix .html, $(names))
txt = $(addsuffix .txt, $(names))

html: $(html)
txt: $(txt)

%.html: %.xml
	xml2rfc --no-dtd --html $< $@

%.txt: %.xml
	xml2rfc --no-dtd --text $< $@

clean:
	rm -f $(html) $(txt)

.PHONY: clean html txt
