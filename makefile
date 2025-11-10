# makes redacted version
unredacted.pdf resume.pdf: resume.tex
	pdflatex resume.tex
	pdflatex -jobname=unredacted '\def\myemail{\href{mailto:$(EMAIL)}{$(EMAIL) }}\def\myphone{$(PHONE_NUMBER) }\def\mylinkedin{\href{$(LINKEDIN)}{$(LINKEDIN)}}\input{resume.tex}'
	make clean

clean:
	rm -f *.aux *.dvi *.log *.out

.PHONY: clean
