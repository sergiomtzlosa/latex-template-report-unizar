# Unofficial LaTeX template for Universidad de Zaragoza

Latex template to create reports/documents with the image of Universidad de Zaragoza.

Ouput PDF [here](report.pdf).

Compile the report.tex file in unix systems:

```
make all
``` 

Recommended OpenSource LaTex editor: [TeXstudio](https://www.texstudio.org/)

## Configure TeXStudio

Over Options -> Texstudio configuration -> Orders, set the following line in section *PdfLaTex*:

```
pdflatex.exe -synctex=1 -interaction=nonstopmode --shell-escape %.tex
```

## Install pygments 

Install pygments on windows: [pygments](https://tex.stackexchange.com/questions/369600/how-to-install-pygments-on-windows-7).

See [Makefile](Makefile) to install pygments on unix systems.

## Install cm-super

Install the cm-super package using the  [graphical package administrator from MikTex](https://tex.stackexchange.com/questions/88368/how-do-i-invoke-cm-super) and refresh the installed fonts.

On GNU/Linux systems: 

```
sudo apt-get install cm-super
```

