# --- SETTINGS ---
# Default engine is pdflatex. 
# To use xelatex, run: make ENGINE=xe
ENGINE ?= xe
BIB_SOURCE = /home/ben/Work/latexthings/mybib.bib
BIB_LINK = mybib.bib

# Logical switch for flags
ifeq ($(ENGINE), xe)
    LATEX_FLAGS = -xelatex -shell-escape -interaction=nonstopmode
else
    LATEX_FLAGS = -pdf -shell-escape -interaction=nonstopmode
endif

LATEX     = latexmk
ALL_TEX   = $(wildcard *.tex)
SOURCES   = $(filter-out chapter%.tex, $(ALL_TEX))
PDFS      = $(SOURCES:.tex=.pdf)

.PHONY: all clean distclean


all: $(BIB_LINK) $(PDFS)

$(PDFS): %.pdf: %.tex $(ALL_TEX)
	$(LATEX) $(LATEX_FLAGS) $<

$(BIB_LINK):
	@if [ ! -L $(BIB_LINK) ] && [ ! -f $(BIB_LINK) ]; then \
		echo "Creating symbolic link for bibliography..."; \
		ln -s $(BIB_SOURCE) $(BIB_LINK); \
	fi

clean:
	$(LATEX) -c
	rm -f *.nav *.snm *.vrb *.xmpi *.tex.blg *.tex.bbl
# Recursively remove latexindent cruft and backups from ALL subfolders
	find . -name "indent.log" -type f -delete
	find . -name "*.bak*" -type f -delete
	@echo "Deep clean of current directory and subfolders finished."

distclean:
	$(LATEX) -C
	rm -f *.nav *.snm *.vrb *.xmpi  *.tex.blg *.tex.bbl
	rm -f $(BIB_LINK)
# xRecursively remove latexindent cruft and backups from ALL subfolders
	find . -name "indent.log" -type f -delete
	find . -name "*.bak*" -type f -delete
	@echo "Deep clean of current directory and subfolders finished."

