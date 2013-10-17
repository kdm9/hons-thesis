COMPILER=lualatex -shell-escape
BIB_COMPILER=biber -q
LATEX_SRC=$(wildcard *.latex)
PIE=perl -pi -e

all: latex clean

latex:
ifneq ($(wildcard $(patsubst %.latex,%.pdf,$(LATEX_SRC))),)
	rm -v $(patsubst %.latex,%.pdf,$(LATEX_SRC))
endif
	$(COMPILER) $(LATEX_SRC)
	$(COMPILER) $(LATEX_SRC)
	ls -lh $(patsubst %.latex,%.pdf,$(LATEX_SRC))

clean:
ifneq ($(wildcard *.bcf *.aux *.bbl *.dvi *.blg *.log *.bak *.idx *.run.xml *-blx.bib *.nav *.out *.snm *.toc *.pyg *.tdo), )
	rm $(wildcard *.bcf *.aux *.bbl *.dvi *.blg *.log *.bak *.idx *.run.xml *-blx.bib *.nav *.out *.snm *.toc *.pyg *.tdo)

endif
