OPTS= -H margins.sty --bibliography ctnhm.bib --csl=ecology-letters.csl 


%.pdf: %.md 
	pandoc  -V geometry:margin=1cm  --latex-engine=xelatex $^ -o $@

all: ctnhm.pdf ctnhm_figures.pdf ctnhm_appendices.pdf  ctnhm.docx


SomeResults.pdf: SomeResults.md
	cp "/home/leonardo/BibTeX/Manuscritos-Critical Transition.bib" ctnhm.bib
	pandoc $< -o $@ $(OPTS)
	evince SomeResults.pdf		

ctnhm.pdf: ctnhm.md 
	cp "/home/leonardo/BibTeX/Manuscritos-Critical Transition.bib" ctnhm.bib
	pandoc $< -o $@ $(OPTS)
	evince ctnhm.pdf		

ctnhm.docx: ctnhm.md 
	cp "/home/leonardo/BibTeX/Manuscritos-Critical Transition.bib" ctnhm.bib
	pandoc $< -o $@ $(OPTS)
			
ctnhm_figures.pdf: ctnhm_figures.md
	pandoc -H ctnhm_figures.sty ctnhm_figures.md -o ctnhm_figures.pdf 
	evince ctnhm_figures.pdf		
