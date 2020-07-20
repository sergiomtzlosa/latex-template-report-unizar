# Plantilla de LaTeX no oficial para la Universidad de Zaragoza

Platilla de LaTeX para realizar informes con imagen de la Universidad de Zaragoza.

Archivo PDF resultante [aqui](report.pdf).

Compilar report.tex en  sistemas *nix:

```
make all
``` 

Editor LaTeX recomendado OpenSource: [TeXstudio](https://www.texstudio.org/)

## WINDOWS

In Options -> Texstudio configuration -> Orders, set the following command for PdfLaTex:

```
pdflatex.exe -synctex=1 -interaction=nonstopmode --shell-escape %.tex
```

On windows, install 
[pygments](https://tex.stackexchange.com/questions/369600/how-to-install-pygments-on-windows-7), for *nix systems see [Makefile](Makefile).
