name = binary-relations


graphs := $(wildcard graphs/*.dot)
graphsdir := $(subst graphs,img,$(graphs))
graphsobj := $(graphsdir:.dot=_dot.pdf)

# You want latexmk to *always* run, because make does not have all the info.
# Also, include non-file targets in .PHONY so they are run regardless of any
# file of the given name existing.
.PHONY: ${name}.pdf all clean

# The first rule in a Makefile is the one executed by default ("make"). It
# should always be the "all" rule, so that "make" and "make all" are identical.
all: ${name}.pdf

# MAIN LATEXMK RULE

# -pdf tells latexmk to generate PDF directly (instead of DVI).
# -pdflatex="" tells latexmk to call a specific backend with specific options.
# -use-make tells latexmk to call make for generating missing files.

# -interaction=nonstopmode keeps the pdflatex backend from stopping at a
# missing file reference and interactively asking you for an alternative.

${name}.pdf: ${name}.tex simple-graph.pdf_t ${graphsobj}
	latexmk -pdf -latex="pdflatex -interaction=nonstopmode" -use-make $<

clean:
	latexmk -CA
	$(MAKE) -C imgs-gen/simple-graph $@
	- rm -rf img

simple-graph.pdf_t: imgs-gen/simple-graph/fig.fig
	$(MAKE) -C imgs-gen/simple-graph


img/%_dot.pdf: graphs/%.dot
	dot -Tpdf -o$@  $<
