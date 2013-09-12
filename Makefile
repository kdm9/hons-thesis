COMPILER=lualatex --interaction=batchmode -shell-escape
BIB_COMPILER=biber -q
LATEX_SRC=thesis.latex
BIB_SRC=thesis.bib
PIE=perl -pi -e

TEXTMP=$(wildcard *.bcf *.aux *.bbl *.dvi *.blg *.log *.bak *.idx *.run.xml *-blx.bib *.nav *.out *.snm *.toc *.tdo *.pyg)

all: latex

latex:
	rm -v $(patsubst %.latex,%.pdf,$(LATEX_SRC))
	$(COMPILER) $(LATEX_SRC)
	$(BIB_COMPILER) $(patsubst %.latex,%,$(LATEX_SRC))
	$(COMPILER) $(LATEX_SRC)
	$(COMPILER) $(LATEX_SRC)
	ls -lh $(patsubst %.latex,%.pdf,$(LATEX_SRC))

clean:
ifneq ($(TEXTMP), )
	rm $(TEXTMP)
endif
