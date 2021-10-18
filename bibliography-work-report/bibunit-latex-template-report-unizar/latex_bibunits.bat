@ECHO OFF
SET FILE=%1
pdflatex -enable-write18 --shell-escape %FILE%
FOR /f %%a IN ('dir /b /s "chapters\*.aux"') DO (
    bibtex %%a
)
pdflatex -enable-write18 --shell-escape %FILE%
pdflatex -enable-write18 --shell-escape %FILE%