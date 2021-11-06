# Docker command to compile with TexLive 2021

## docker run --rm -it -v $(pwd):/workdir danteev/texlive latexmk -pdf report.tex -pdflatex -enable-write18 -shell-escape
