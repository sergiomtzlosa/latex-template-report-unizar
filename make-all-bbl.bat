@ECHO OFF
REM === Configuration ===
SET FILE=report.tex
SET BASENAME=%~n1
IF "%BASENAME%"=="" SET BASENAME=%FILE:.tex=%

REM === Initial LaTeX Run ===
ECHO Running pdflatex (1st pass)...
pdflatex -draftmode -enable-write18 --shell-escape "%FILE%"
IF ERRORLEVEL 1 GOTO :error

REM === Glossaries (if needed) ===
ECHO Running makeglossaries...
makeglossaries "%BASENAME%"
REM Ignore errors if glossaries not used

REM === Second LaTeX Run ===
ECHO Running pdflatex (2nd pass)...
pdflatex -enable-write18 --shell-escape "%FILE%"
IF ERRORLEVEL 1 GOTO :error

REM === Third LaTeX Run ===
ECHO Running pdflatex (3rd pass)...
pdflatex -enable-write18 --shell-escape "%FILE%"
IF ERRORLEVEL 1 GOTO :error

REM === Run BibTeX on all .aux files ===
ECHO Running BibTeX on all .aux files...
FOR %%a IN (*.aux) DO (
    ECHO BibTeX on %%a...
    bibtex "%%a"
)

REM === Glossaries again (if needed) ===
ECHO Running makeglossaries (again)...
makeglossaries "%BASENAME%"

REM === Final LaTeX Runs ===
ECHO Running pdflatex (final passes)...
pdflatex -enable-write18 --shell-escape "%FILE%"
pdflatex -enable-write18 --shell-escape "%FILE%"
pdflatex -enable-write18 --shell-escape "%FILE%"

ECHO Compilation complete!
GOTO :eof

:error
ECHO Error occurred during compilation. Exiting.
EXIT /B 1