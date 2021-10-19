#!/bin/bash
FILE=$1
NAME="${FILE%.*}"
pdflatex -enable-write18 --shell-escape $FILE
buFiles=$(ls bu*.aux)
for f in ${buFiles[@]}; do
    bibtex $f
done
bibtex ${NAME}.aux
pdflatex -enable-write18 --shell-escape $FILE
pdflatex -enable-write18 --shell-escape $FILE
