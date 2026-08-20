include .env

all: unredacted.pdf resume.pdf
	@echo "PDFs generated."

unredacted.pdf: resume.typ
	typst compile --input EMAIL="$(EMAIL)" --input PHONE_NUMBER="$(PHONE_NUMBER)" resume.typ unredacted.pdf

resume.pdf: resume.typ
	typst compile resume.typ resume.pdf

.PHONY: all
