names = $(basename $(wildcard draft*.xml))
html = $(addsuffix .html, $(names))
txt = $(addsuffix .txt, $(names))
cbor = $(addsuffix .cbor, $(basename $(wildcard *.diag-cbor)))
protobuf = $(addsuffix .pb, $(basename $(wildcard *.txtpb)))

xml2rfc = xml2rfc --cache .cache --v3 

html: $(html)
txt: $(txt)
cbor: $(cbor)
protobuf: $(protobuf)

%.html: %.xml
	 $(xml2rfc) --html $<

%.txt: %.xml
	$(xml2rfc) --text $<

%.cbor: %.diag-cbor
	diag2cbor.rb < $< > $@

%.pb: %.txtpb
	protoc --encode=ExampleResponse example.proto < $< > $@

clean:
	rm -f $(html) $(txt) $(protobuf)

.PHONY: clean html txt cbor protobuf
