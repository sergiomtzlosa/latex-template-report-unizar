.PHONY: all clean distclean

DOC := report
PUBS := publications
CHECKPUBS := $(shell test -f $(PUBS).aux && echo "true")
CHECKREPORT := $(shell test -f $(DOC).pdf && echo "true")
OS_NAME := $(shell uname -s | tr A-Z a-z)
CHECK_DOCKER := $(which docker)

# base compilation
base:
	pdflatex -enable-write18 --shell-escape $(DOC).tex

# compile without bibliography
nobib:
	pdflatex -enable-write18 --shell-escape $(DOC).tex && \
	pdflatex -enable-write18 --shell-escape $(DOC).tex

# compile with index and bibliography
all:
	pdflatex -draftmode -enable-write18 --shell-escape $(DOC).tex
	makeglossaries $(DOC)
	bibtex $(DOC).aux
ifeq ($(CHECKPUBS),true)
	bibtex $(PUBS).aux
endif
	pdflatex -draftmode -enable-write18 --shell-escape $(DOC).tex
	pdflatex -enable-write18 --shell-escape $(DOC).tex
	echo "" && \
	echo "\033[33;1mPDFLaTex compilation finished !!!\033[0m" && \
	echo ""

# compile with index and without bibliography
simple:
	pdflatex -draftmode -enable-write18 --shell-escape $(DOC).tex && \
	makeglossaries $(DOC) && \
	pdflatex -draftmode -enable-write18 --shell-escape $(DOC).tex && \
	pdflatex -enable-write18 --shell-escape $(DOC).tex

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
        pdflatex -draftmode -enable-write18 --shell-escape "\def\forceprint{}\input{${DOC}}" $(DOC).tex && \
        makeglossaries $(DOC) && \
        pdflatex -draftmode -enable-write18 --shell-escape "\def\forceprint{}\input{${DOC}}" $(DOC).tex && \
        pdflatex -enable-write18 --shell-escape "\def\forceprint{}\input{${DOC}}" $(DOC).tex

# force print style
print-force:
	./utils/convert-grayscale.sh && \
	pdflatex -draftmode -enable-write18 --shell-escape "\def\forceprint{}\input{${DOC}}" $(DOC).tex && \
        makeglossaries $(DOC) && \
        pdflatex -draftmode -enable-write18 --shell-escape "\def\forceprint{}\input{${DOC}}" $(DOC).tex && \
        pdflatex -enable-write18 --shell-escape "\def\forceprint{}\input{${DOC}}" $(DOC).tex

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
	pip install wordcloud

install-texlive:
	sudo apt-get install texlive-full

install-deps:
ifeq ($(OS_NAME),linux)
	sudo apt-get update && \
	sudo apt-get install docker python3-pygments cm-super pdfgrep poppler-utils texlive-pstricks && \
	sudo apt -y install texlive-science
endif
ifeq ($(OS_NAME),darwin)
	brew install docker pygments pdf2htmlEX pdfgrep poppler
endif

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

# create word cloud
word-cloud:
ifeq ($(CHECKREPORT),true)
	echo "" && \
	echo "\033[33;1mCreating word cloud, please wait ... \033[0m" && \
	echo "" && \
	pdftotext report.pdf - | wordcloud_cli --height 3000 --width 2000 --background white --imagefile images/wordcloud.png
endif

# compile, convert images to black and white and convert pdf to html
full-print: all print-images pdf-html

# compile and convert pdf to html
full: all print-images pdf-html

# compile book cover with pdflatex
cover-pdflatex:
	cd book-cover/universal && \
	pdflatex -enable-write18 --shell-escape book_cover.tex && \
	cp book_cover.pdf ../../ && \
	echo "" && \
        echo "\033[33;1mPDFLATEX COVER COMPILATION DONE !!!\033[0m" && \
        echo ""

#compile cover with latex
cover-latex:
	cd book-cover/universal && \
	latex --shell-escape "\def\latexcompiler{}\input{book_cover}" book-cover/universal/book_cover.tex && \
	dvipdf -dNOSAFER -dALLOWPSTRANSPARENCY book_cover.dvi book_cover.pdf && \
	cp book_cover.pdf ../../ && \
        echo "" && \
        echo "\033[33;1mLATEX COVER COMPILATION DONE !!!\033[0m" && \
        echo ""

# merge main PDF file and cover
merge-cover:
ifneq ($(CHECK_DOCKER),'')
	docker run --rm -v `pwd`:/pdf sergiomtzlosa/gsexiftool gs -dPrinted=false -sDEVICE=pdfwrite -dCompatibilityLevel=1.5 -dNOPAUSE -dQUIET -dBATCH -dEmbedAllFonts=true -dDetectDuplicateImages -dPDFSETTINGS=/prepress -sDEVICE=pdfwrite -sOUTPUTFILE=report-combine.pdf book_cover.pdf report.pdf && \
	echo "" && \
	echo "\033[33;1mPDF file + cover merged !!!\033[0m" && \
	echo ""
else
	echo "" && \
	echo "\033[33;1mDOCKER NOT INSTALLED !!!\033[0m" && \
	echo ""
endif

# reduce size main PDF
reduce-pdf:
ifneq ($(CHECK_DOCKER),'')
	docker run --rm -v `pwd`:/pdf sergiomtzlosa/gsexiftool gs -dPrinted=false -sDEVICE=pdfwrite -dCompatibilityLevel=1.5 -dNOPAUSE -dQUIET -dBATCH -dEmbedAllFonts=true -dDetectDuplicateImages -dPDFSETTINGS=/prepress -sDEVICE=pdfwrite -sOUTPUTFILE=report-reduced.pdf report.pdf && \
	echo "" && \
	echo "\033[33;1mPDF file reduced !!!\033[0m" && \
	echo ""
else
	echo "" && \
	echo "\033[33;1mDOCKER NOT INSTALLED !!!\033[0m" && \
	echo ""
endif

# compile cover and merge with main document
mm-cover: cover-latex merge-cover

# compile all with cover
all-cover: all cover-latex reduce-pdf merge-cover

# compile all with cover and word cloud
all-cover-wc: word-cloud all cover-latex merge-cover

# reduce and merge pdf file
reduce-merge-pdf: cover-latex reduce-pdf merge-cover

# search in pdf file
# USAGE: make search-pdf SEARCH_TERM=Kittel
search-pdf:
	pdfgrep -n -R "$(SEARCH_TERM)" $(DOC).pdf | cat

# search in tex files
# USAGE: make search-tex SEARCH_TERM=Kittel
search-tex:
	grep -rnw --include \*.tex '.' -e '$(SEARCH_TERM)' --color=always | cat
