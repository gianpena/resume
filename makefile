include .env

all: unredacted.pdf resume.pdf
	@echo "PDFs generated."

unredacted.pdf: resume.tex
	pdflatex -jobname=unredacted '\def\myemail{\href{mailto:$(EMAIL)}{$(EMAIL) }}\def\myphone{$(PHONE_NUMBER) }\def\mylinkedin{\href{$(LINKEDIN)}{$(LINKEDIN)}}\input{resume.tex}'
	make clean

resume.pdf: resume.tex
	pdflatex resume.tex
	make clean

clean:
	rm -f *.aux *.dvi *.log *.out

.PHONY: clean
