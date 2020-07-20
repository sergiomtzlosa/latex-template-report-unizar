# Plantilla de LaTeX no oficial para la Universidad de Zaragoza

Platilla de LaTeX para realizar informes con imagen de la Universidad de Zaragoza.

Archivo PDF resultante [aqui](report.pdf).

Compilar report.tex en sistemas unix:

```
make all
``` 

Editor LaTeX recomendado OpenSource: [TeXstudio](https://www.texstudio.org/)

## WINDOWS

En Options -> Texstudio configuration -> Orders, poner la siguiente linea en la seccion de PdfLaTex:

```
pdflatex.exe -synctex=1 -interaction=nonstopmode --shell-escape %.tex
```

En windows, instalar [pygments](https://tex.stackexchange.com/questions/369600/how-to-install-pygments-on-windows-7), para instalar pygments en sistemas unix mirar [Makefile](Makefile).
