COMPILER=lualatex --interaction=batchmode
BIB_COMPILER=biber
LATEX_SRC=$(wildcard *.latex)
BIB_SRC=$(wildcard *.bib)
PIE=perl -pi -e
all: latex

latex: bib_preprocess
	rm -v $(patsubst %.latex,%.pdf,$(LATEX_SRC))
	$(COMPILER) $(LATEX_SRC)
	$(BIB_COMPILER) $(patsubst %.latex,%,$(LATEX_SRC))
	$(COMPILER) $(LATEX_SRC)
	$(COMPILER) $(LATEX_SRC)
	ls -lh $(patsubst %.latex,%.pdf,$(LATEX_SRC))

bib_preprocess:
	# Remove international chars
	$(PIE) 's/ü/\{\\" u\}/' $(BIB_SRC)
	$(PIE) 's/Å/\{\\AA\}/' $(BIB_SRC)

clean:
	rm -v *.bcf *.aux *.bbl *.dvi *.blg *.log *.bak *.idx *.run.xml *-blx.bib *.nav *.out *.snm *.toc 2>/dev/null
