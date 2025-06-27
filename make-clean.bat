@ECHO OFF
REM Cleanup script for LaTeX auxiliary files

ECHO Deleting LaTeX auxiliary files...

DEL /Q *.aux *.bbl *.blg *.glg *.glo *.gls *.ist *.lof *.log *.lot *.out *.toc *.acn *.acr *.alg *.fdb_latexmk *.fls *.synctex.gz *.nav *.snm

ECHO Cleanup complete!