name := $(shell basename $(dir $(abspath $(lastword $(MAKEFILE_LIST)))))

fig = fig.fig
bak = fig.fig.bak
install_dir := ../..
tex := $(install_dir)/$(name).pdf_t
pdf := $(install_dir)/$(name).pdf

.PHONY: all clean

all: $(tex) $(pdf)

$(pdf): $(fig)
	mkdir -p $(install_dir)
	fig2dev -L pdftex $(fig) $(pdf)

$(tex): $(fig) $(pdf)
	mkdir -p $(install_dir)
	fig2dev -L pdftex_t -p $(name).pdf $(fig) $(tex)

clean:
	- rm -f $(tex)
	- rm -f $(pdf)
	- rm -f $(bak)
