CLEAN = rm -f *.aux *.dvi *.log *.out

# makes redacted versions
resume.pdf: resume.tex
	pdflatex resume.tex
	$(CLEAN)

unredacted: resume.tex
	pdflatex -jobname=unredacted '\def\myemail{\href{mailto:$(EMAIL)}{$(EMAIL)}}\def\myphone{$(PHONE_NUMBER) }\def\mylinkedin{\href{$(LINKEDIN)}{$(LINKEDIN)}}\input{resume.tex}'
	$(CLEAN)

clean:
	$(CLEAN)

.PHONY: unredacted clean
