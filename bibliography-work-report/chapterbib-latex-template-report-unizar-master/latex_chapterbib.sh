#!/bin/bash
FILE=$1
pdflatex -enable-write18 --shell-escape $FILE
chapFiles=$(ls chapters/*.aux)
for f in ${chapFiles[@]}; do
    bibtex $f
done
pdflatex -enable-write18 --shell-escape $FILE
pdflatex -enable-write18 --shell-escape $FILE
