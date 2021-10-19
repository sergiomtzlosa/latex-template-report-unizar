@ECHO OFF
SET FILE=%1
SET NAME=%~n1
pdflatex -enable-write18 --shell-escape %FILE%
FOR /f %%a IN ('dir /b /s "bu*.aux"') DO (
    bibtex %%a
)
bibtex %NAME%.aux
pdflatex -enable-write18 --shell-escape %FILE%
pdflatex -enable-write18 --shell-escape %FILE%