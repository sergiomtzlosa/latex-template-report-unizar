.PHONY: all clean distclean
.SILENT: help all all-cover search-tex search-pdf

DOC := report
PUBS := publications

ifneq ($(OS),Windows_NT)
EXISTSBIBS := $(shell grep -rnw --include \*.tex '.' -e '\\bibliography{' --color=always --exclude-dir=bibliography-work-report > /dev/null && echo "true")
OUTBIBS := $(shell grep -rnw --include \*.tex '.' -e '%\\bibliography{' --color=always --exclude-dir=bibliography-work-report > /dev/null && echo "false")
SHELLBIBS := $(shell if [ "$(OUTBIBS)" = "false" ]; then echo "false"; else echo "true"; fi)
CHECKBIBS := $(shell if [ "$(EXISTSBIBS)" = "true" ]; then echo "$(SHELLBIBS)"; else echo "false"; fi)

CHECKPUBS := $(shell test -f $(PUBS).aux && echo "true")
CHECKREPORT := $(shell test -f $(DOC).pdf && echo "true")

EXISTSGLOSSARIES := $(shell grep -rnw --include \*.tex '.' -e 'makeglossaries' --color=always --exclude-dir=bibliography-work-report > /dev/null && echo "true")
OUTGLOSSARIES := $(shell grep -rnw --include \*.tex '.' -e '%\\makeglossaries' --color=always --exclude-dir=bibliography-work-report > /dev/null && echo "false")
CHECKGLOSSARIES := $(shell if [ "$(OUTGLOSSARIES)" = "false" ]; then echo "false"; else echo "true"; fi)
SHELLGLOSSARIES := $(shell if [ "$(EXISTSGLOSSARIES)" = "true" ]; then echo "$(CHECKGLOSSARIES)"; else echo "false"; fi)

OS_NAME := $(shell uname -s | tr A-Z a-z)
CHECK_DOCKER := $(shell which docker)
endif

# base compilation
base:
	pdflatex -enable-write18 --shell-escape $(DOC).tex

# compile without bibliography
nobib:
	pdflatex -draftmode -enable-write18 --shell-escape $(DOC).tex
ifeq ($(SHELLGLOSSARIES),false)
	echo "" && \
	sh -c 'echo "\033[33;1mGlossary not found !!!\033[0m"' && \
	echo ""
else
	makeglossaries $(DOC)
	echo "" && \
	sh -c 'echo "\033[33;1mGlossary found !!!\033[0m"' && \
	echo ""
endif
	pdflatex -draftmode -enable-write18 --shell-escape $(DOC).tex
	pdflatex -enable-write18 --shell-escape $(DOC).tex
	echo "" && \
	sh -c 'echo "\033[33;1mPDFLaTex compilation finished !!!\033[0m"' && \
	echo ""

# compile with index and bibliography
all:
ifeq ($(OS),Windows_NT)
	compile-latex.bat $(DOC).tex
else
	pdflatex -draftmode -enable-write18 --shell-escape $(DOC).tex
ifeq ($(SHELLGLOSSARIES),false)
	echo "" && \
	sh -c 'echo "\033[33;1mGlossary not found !!!\033[0m"' && \
	echo ""
else
	makeglossaries $(DOC)
	echo "" && \
	sh -c 'echo "\033[33;1mGlossary found !!!\033[0m"' && \
	echo ""
endif
ifeq ($(CHECKBIBS),true)
	bibtex $(DOC).aux
	echo "" && \
	sh -c 'echo "\033[33;1mBibliography found !!!\033[0m"' && \
	echo ""
else
	echo "" && \
	sh -c 'echo "\033[33;1mBibliography not found !!!\033[0m"' && \
	echo ""
endif
ifeq ($(CHECKPUBS),true)
	bibtex $(PUBS).aux
endif
	pdflatex -draftmode -enable-write18 --shell-escape $(DOC).tex
	pdflatex -enable-write18 --shell-escape $(DOC).tex
	echo "" && \
	sh -c 'echo "\033[33;1mPDFLaTex compilation finished !!!\033[0m"' && \
	echo ""
endif

# compile with index and without bibliography
simple: nobib

# clean compilation

distclean:
	rm -f *.aux \
        $(DOC).log \
        $(DOC).blg \
        $(DOC).bbl \
        $(DOC).out \
        $(DOC).dvi \
	*.mw

# clean compilation
clean:
ifeq ($(OS),Windows_NT)
	del /q *.aux $(DOC).log $(DOC).blg $(DOC).bbl $(DOC).out $(DOC).dvi $(DOC).pdf *.mw >nul 2>&1
else
	rm -f *.aux \
	$(DOC).log \
	$(DOC).blg \
	$(DOC).bbl \
	$(DOC).out \
	$(DOC).dvi \
	$(DOC).pdf \
	*.mw
endif

compile-grayscale:
	pdflatex -draftmode -enable-write18 --shell-escape "\def\forceprint{}\input{${DOC}}" $(DOC).tex
ifeq ($(SHELLGLOSSARIES),false)
	echo "" && \
	sh -c 'echo "\033[33;1mGlossary not found !!!\033[0m"' && \
	echo ""
else
	makeglossaries $(DOC)
	echo "" && \
	sh -c 'echo "\033[33;1mGlossary found !!!\033[0m"' && \
	echo ""
endif
ifeq ($(CHECKBIBS),true)
	bibtex $(DOC).aux
	echo "" && \
	sh -c 'echo "\033[33;1mBibliography found !!!\033[0m"' && \
	echo ""
else
	echo "" && \
	sh -c 'echo "\033[33;1mBibliography not found !!!\033[0m"' && \
	echo ""
endif
ifeq ($(CHECKPUBS),true)
	bibtex $(PUBS).aux
	echo "" && \
	sh -c 'echo "\033[33;1mBibliography not found !!!\033[0m"' && \
	echo ""
endif
	pdflatex -draftmode -enable-write18 --shell-escape "\def\forceprint{}\input{${DOC}}" $(DOC).tex
	pdflatex -enable-write18 --shell-escape "\def\forceprint{}\input{${DOC}}" $(DOC).tex
	echo "" && \
	sh -c 'echo "\033[33;1mPDFLaTex compilation finished !!!\033[0m"' && \
	echo ""

# compile black text but colourful images
compile-black:
	pdflatex -draftmode -enable-write18 --shell-escape "\def\compileblack{}\input{${DOC}}" $(DOC).tex
ifeq ($(SHELLGLOSSARIES),false)
	echo "" && \
	sh -c 'echo "\033[33;1mGlossary not found !!!\033[0m"' && \
	echo ""
else
	makeglossaries $(DOC)
	echo "" && \
	sh -c 'echo "\033[33;1mGlossary found !!!\033[0m"' && \
	echo ""
endif
ifeq ($(CHECKBIBS),true)
	bibtex $(DOC).aux
	echo "" && \
	sh -c 'echo "\033[33;1mBibliography found !!!\033[0m"' && \
	echo ""
else
	echo "" && \
	sh -c 'echo "\033[33;1mBibliography not found !!!\033[0m"' && \
	echo ""
endif
ifeq ($(CHECKPUBS),true)
	bibtex $(PUBS).aux
	echo "" && \
	sh -c 'echo "\033[33;1mBibliography not found !!!\033[0m"' && \
	echo ""
endif
	pdflatex -draftmode -enable-write18 --shell-escape "\def\compileblack{}\input{${DOC}}" $(DOC).tex
	pdflatex -enable-write18 --shell-escape "\def\compileblack{}\input{${DOC}}" $(DOC).tex
	echo "" && \
	sh -c 'echo "\033[33;1mPDFLaTex compilation finished !!!\033[0m"' && \
	echo ""

# convert images to black and white
print-images:
	chmod +x utils/convert-grayscale.sh && ./utils/convert-grayscale.sh && echo ""

# compile pdf and convert images to black and white
print-force: print-images compile-grayscale

# check convert imagems to grayscale
convert-grayscale: $(eval SHELL:=/bin/bash)
	@read -p $$'\e[33;1mDo you want to convert images to grayscale? [y/n]\e[0m ' -n 1 -r; \
	echo ""; \
	if [[ $$REPLY =~ ^[Yy] ]]; \
	then \
		echo "" && make print-images; \
	fi

# force print style
print: convert-grayscale compile-grayscale

# compress final pdf
compress:
	docker run --rm -v `pwd`:/pdf sergiomtzlosa/gsexiftool gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.5 -dNOPAUSE -dQUIET -dBATCH -dEmbedAllFonts=true -dPrinted=false -dSubsetFonts=true -dDetectDuplicateImages -dPDFSETTINGS=/prepress -sOutputFile=${DOC}-compress.pdf ${DOC}.pdf && \
	docker run --rm -v `pwd`:/pdf sergiomtzlosa/gsexiftool exiftool -overwrite_original -all= -tagsFromFile ${DOC}.pdf ${DOC}-compress.pdf

# extra compress
compress-big:
	docker run --rm -v `pwd`:/pdf sergiomtzlosa/gsexiftool gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/default -dPrinted=false -dNOPAUSE -dQUIET -dBATCH -dDetectDuplicateImages -dCompressFonts=true -r150 -sOutputFile=${DOC}-compress-big.pdf ${DOC}.pdf
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
	zip html/$(DOC).zip html/$(DOC).html
	rm html/$(DOC).html

# create word cloud
word-cloud:
ifeq ($(CHECKREPORT),true)
	echo "" && \
	sh -c 'echo "\033[33;1mCreating word cloud, please wait ... \033[0m"' && \
	echo "" && \
	pdftotext $(DOC).pdf - | wordcloud_cli --height 3000 --width 2000 --background white --imagefile images/wordcloud.png
endif

# compile, convert images to black and white and convert pdf to html
full-print: all print pdf-html

# compile book cover with pdflatex
cover-pdflatex:
	cd book-cover/universal && \
	pdflatex -enable-write18 --shell-escape book_cover.tex && \
	cp book_cover.pdf ../../ && \
	echo "" && \
        sh -c 'echo "\033[33;1mPDFLATEX COVER COMPILATION DONE !!!\033[0m"' && \
        echo ""

#compile cover with latex
cover-latex:
	cd book-cover/universal && \
	latex --shell-escape "\def\latexcompiler{}\input{book_cover}" book-cover/universal/book_cover.tex && \
	dvipdf -dNOSAFER -dALLOWPSTRANSPARENCY book_cover.dvi book_cover.pdf && \
	cp book_cover.pdf ../../ && \
        echo "" && \
        sh -c 'echo "\033[33;1mLATEX COVER COMPILATION DONE !!!\033[0m"' && \
        echo ""

# merge main PDF file and cover
merge-cover:
ifneq ($(CHECK_DOCKER),'')
	docker run --rm -v `pwd`:/pdf sergiomtzlosa/gsexiftool gs -dPrinted=false -sDEVICE=pdfwrite -dCompatibilityLevel=1.5 -dNOPAUSE -dQUIET -dBATCH -dEmbedAllFonts=true -dDetectDuplicateImages -dPDFSETTINGS=/prepress -sDEVICE=pdfwrite -sOUTPUTFILE=$(DOC)-combine.pdf book_cover.pdf $(DOC).pdf && \
	echo "" && \
	sh -c 'echo "\033[33;1mPDF file + cover merged !!!\033[0m"' && \
	echo ""
else
	echo "" && \
	sh -c 'echo "\033[33;1mDOCKER NOT INSTALLED !!!\033[0m"' && \
	echo ""
endif

# reduce size main PDF
reduce-pdf:
ifneq ($(CHECK_DOCKER),'')
	docker run --rm -v `pwd`:/pdf sergiomtzlosa/gsexiftool gs -dPrinted=false -sDEVICE=pdfwrite -dCompatibilityLevel=1.5 -dNOPAUSE -dQUIET -dBATCH -dEmbedAllFonts=true -dDetectDuplicateImages -dPDFSETTINGS=/prepress -sDEVICE=pdfwrite -sOUTPUTFILE=$(DOC)-reduced.pdf $(DOC).pdf && \
	echo "" && \
	sh -c 'echo "\033[33;1mPDF file reduced !!!\033[0m"' && \
	echo ""
else
	echo "" && \
	sh -c 'echo "\033[33;1mDOCKER NOT INSTALLED !!!\033[0m"' && \
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
	pdfgrep -n -R "$(SEARCH_TERM)" $(DOC).pdf --exclude=bibliography-work-report | cat

# search in tex files
# USAGE: make search-tex SEARCH_TERM=Kittel
search-tex:
	grep -rnw --include \*.tex '.' -e '$(SEARCH_TERM)' --color=always --exclude-dir=bibliography-work-report | cat

# Help command
help:
	echo "" && \
	echo "Compilation help" && \
	echo "---------------------" && \
	sh -c 'echo "\033[33;1mmake base\033[0m --> Base compilation (unused)"' && \
	sh -c 'echo "\033[33;1mmake nobib\033[0m --> Full compilation without bibliography"' && \
	sh -c 'echo "\033[33;1mmake all\033[0m --> Full compilation with all latex options"' && \
	sh -c 'echo "\033[33;1mmake simple\033[0m --> Same as make nobib"' && \
	sh -c 'echo "\033[33;1mmake distclean\033[0m --> Clean compilation files"' && \
	sh -c 'echo "\033[33;1mmake clean\033[0m --> Clean compilation files and pdf file"' && \
	sh -c 'echo "\033[33;1mmake print\033[0m --> Full compilation in grayscale for printing"' && \
	sh -c 'echo "\033[33;1mmake print\033[0m --> Force full compilation in grayscale for printing"' && \
	sh -c 'echo "\033[33;1mmake compress\033[0m --> Compress output pdf"' && \
	sh -c 'echo "\033[33;1mmake compress-big\033[0m --> Strong compressing output pdf"' && \
	sh -c 'echo "\033[33;1mmake install\033[0m --> Install dependencies"' && \
	sh -c 'echo "\033[33;1mmake install-texlive\033[0m --> Install TeXLive"' && \
	sh -c 'echo "\033[33;1mmake pdf-html\033[0m --> Convert output pdf file into beautiful HTML"' && \
	sh -c 'echo "\033[33;1mmake word-cloud\033[0m --> Create a fancy word cloud image"' && \
	sh -c 'echo "\033[33;1mmake full-print\033[0m --> Compile in grayscale for printing and convert output pdf into HTML"' && \
	sh -c 'echo "\033[33;1mmake cover-pdflatex\033[0m --> Compile book cover with pdflatex"' && \
	sh -c 'echo "\033[33;1mmake cover-latex\033[0m --> Compile book cover with latex"' && \
	sh -c 'echo "\033[33;1mmake mm-cover\033[0m --> Compile book cover and merge it with output main pdf"' && \
	sh -c 'echo "\033[33;1mmake all-cover\033[0m --> Full compilation with all options, reduce size of main pdf and merge cover"' && \
	sh -c 'echo "\033[33;1mmake all-cover-wc\033[0m --> Full compilation with all options, reduce size of main pdf, merge cover and create word cloud image"' && \
	sh -c 'echo "\033[33;1mmake search-pdf SEARCH_TERM=Kittel\033[0m --> Search string in output pdf"' && \
	sh -c 'echo "\033[33;1mmake search-tex SEARCH_TERM=Kittel\033[0m --> Search string in TeX files"' && \
	sh -c 'echo "\033[33;1mmake compile-black\033[0m -->  compile black text but colourful images"' && \
	sh -c 'echo "\033[33;1mmake reduce-merge-pdf\033[0m --> Reduce pdf file and merge cover in a new pdf file"' && \
	echo ""
