names = $(basename $(wildcard draft*.xml))
html = $(addsuffix .html, $(names))
txt = $(addsuffix .txt, $(names))

html: $(html)
txt: $(txt)

%.html: %.xml
	xml2rfc --v3 --html $<

%.txt: %.xml
	xml2rfc --v3 --text $<

clean:
	rm -f $(html) $(txt)

.PHONY: clean html txt
