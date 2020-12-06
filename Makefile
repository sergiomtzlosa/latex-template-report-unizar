.PHONY: all clean distclean

DOC := report
PUBS := publications
CHECKPUBS := $(shell test -f $(PUBS).aux && echo "true")
OS_NAME := $(shell uname -s | tr A-Z a-z)

# base compilation
base:
	pdflatex --shell-escape $(DOC).tex

# compile without bibliography
nobib:
	pdflatex --shell-escape $(DOC).tex && \
	pdflatex --shell-escape $(DOC).tex

# compile with index and bibliography
all:
	pdflatex --shell-escape $(DOC).tex
	makeglossaries $(DOC)
	bibtex $(DOC).aux
ifeq ($(CHECKPUBS),true)
	bibtex $(PUBS).aux
endif
	pdflatex --shell-escape $(DOC).tex
	pdflatex --shell-escape $(DOC).tex
	echo "" && \
	echo "\033[33;1mPdfLaTex compilation finished !!!\033[0m" && \
	echo ""

# compile with index and without bibliography
simple:
	pdflatex --shell-escape $(DOC).tex && \
	makeglossaries $(DOC) && \
	pdflatex --shell-escape $(DOC).tex && \
	pdflatex --shell-escape $(DOC).tex

# clean compilation
distclean:
	rm -f *.aux \
        $(DOC).log \
        $(DOC).blg \
        $(DOC).bbl \
        $(DOC).out \
        $(DOC).dvi

# clean compilation
clean:
	rm -f *.aux \
	$(DOC).log \
	$(DOC).blg \
	$(DOC).bbl \
	$(DOC).out \
	$(DOC).dvi \
	$(DOC).pdf

# compile pdf and convert images to black and white
print:  all
	./utils/convert-grayscale.sh && \
	pdflatex --shell-escape "\def\forceprint{}\input{${DOC}}" $(DOC).tex

# force print style
print-force:
	./utils/convert-grayscale.sh && \
	pdflatex --shell-escape "\def\forceprint{}\input{${DOC}}" $(DOC).tex

# convert images to black and white
print-images:
	chmod +x utils/convert-grayscale.sh && ./utils/convert-grayscale.sh

# compress final pdf
compress:
	docker run --rm -v `pwd`:/pdf sergiomtzlosa/gsexiftool gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.5 -dNOPAUSE -dQUIET -dBATCH -dEmbedAllFonts=true -dPrinted=false -dSubsetFonts=true -dDetectDuplicateImages -dPDFSETTINGS=/prepress -sOutputFile=${DOC}-compress.pdf ${DOC}.pdf && \
	docker run --rm -v `pwd`:/pdf sergiomtzlosa/gsexiftool exiftool -overwrite_original -all= -tagsFromFile ${DOC}.pdf ${DOC}-compress.pdf

# extra compress
compress-big:
	docker run --rm -v `pwd`:/pdf sergiomtzlosa/gsexiftool gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/default -dPrinted=false -dNOPAUSE -dQUIET -dBATCH -dDetectDuplicateImages -dCompressFonts=true -r150 -sOutputFile=${DOC}-compress-big.pdf  ${DOC}.pdf
	docker run --rm -v `pwd`:/pdf sergiomtzlosa/gsexiftool exiftool -overwrite_original -all= -tagsFromFile ${DOC}.pdf ${DOC}-compress-big.pdf

# install dependencies to convert pdf to html
# install ImageMagick 7: https://www.tecmint.com/install-imagemagick-on-debian-ubuntu/
install: install-deps

install-deps:
ifeq ($(OS_NAME),linux)
	sudo apt-get update && \
	sudo apt-get install texlive-full docker python-pygments python3-pygments cm-super pdfgrep
endif
ifeq ($(OS_NAME),darwin)
	brew install docker pygments pdf2htmlEX pdfgrep
endif

# USAGE: make search-pdf SEARCH_TERM=Kittel
search-pdf:
	pdfgrep -n -R "$(SEARCH_TERM)" $(DOC).pdf

# convert pdf to html
pdf-html:
	mkdir -p html
ifeq ($(OS_NAME),linux)
	docker run -ti --rm -v `pwd`:/pdf sergiomtzlosa/pdf2htmlex pdf2htmlEX --zoom 1.5 $(DOC).pdf html/$(DOC).html
endif
ifeq ($(OS_NAME),darwin)
	pdf2htmlEX --zoom 1.5 $(DOC).pdf html/$(DOC).html
endif
	zip html/report.zip html/report.html
	rm html/report.html

# compile, convert images to black and white and convert pdf to html
full-print: all print-images pdf-html

# compile and convert pdf to html
full: all print-images pdf-html

# compile book cover with pdflatex
cover-pdflatex:
	cd book-cover/universal && \
	pdflatex --shell-escape book_cover.tex && \
	cp book_cover.pdf ../../ && \
	echo "" && \
        echo "\033[33;1mDONE !!!\033[0m" && \
        echo ""

#compile cover with latex
cover-latex:
	cd book-cover/universal && \
	latex --shell-escape "\def\latexcompiler{}\input{book_cover}" book-cover/universal/book_cover.tex && \
	dvipdf book_cover.dvi book_cover.pdf && \
	cp book_cover.pdf ../../ && \
        echo "" && \
        echo "\033[33;1mDONE !!!\033[0m" && \
        echo ""

# compile all with cover
all-cover: all cover-latex
	docker run --rm -v `pwd`:/pdf sergiomtzlosa/gsexiftool gs -dPrinted=false -sDEVICE=pdfwrite -dCompatibilityLevel=1.5 -dNOPAUSE -dQUIET -dBATCH -dEmbedAllFonts=true -dDetectDuplicateImages -dPDFSETTINGS=/prepress -sDEVICE=pdfwrite -sOUTPUTFILE=report-combine.pdf book_cover.pdf report.pdf && \
        echo "" && \
        echo "\033[33;1mpdf merged !!!\033[0m" && \
        echo ""
