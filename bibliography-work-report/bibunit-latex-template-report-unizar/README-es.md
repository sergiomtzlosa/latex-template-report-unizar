# Plantilla de LaTeX no oficial para tésis/informes/libros con logos y estilo de la Universidad de Zaragoza

Platilla de LaTeX para realizar informes/documentos/libros/tésis con el logo de la Universidad de Zaragoza.

Archivo PDF resultante [aqui](report.pdf).

Compilar el archivo report.tex en sistemas unix:

```
make all
```

Editor LaTeX OpenSource recomendado: [TeXstudio](https://www.texstudio.org/)

## Configurar TeXStudio

En Options -> Texstudio configuration -> Orders, poner la siguiente linea en la seccion de *PDFLaTex*:

```
pdflatex -synctex=1 --shell-escape -interaction=nonstopmode -enable-write18 %.tex
```

## Paquete bibunits

El paquete bibunits necesita unos pasos de compilación especiales, puedes seguir usando el comando **make all** como de costumbre, pero si quieres usar TexStudio y bibuntis, debes incluir el script **latex_bibunits.sh** en el proceso de compilación, para hacer esto, mira la imagen [config-texstusio-bibunits-compile-script.png](https://raw.githubusercontent.com/sergiomtzlosa/latex-template-report-unizar/master/bibliography-work-report/bibunit-latex-template-report-unizar/config-texstusio-bibunits-compile-script.png) para establecer el script en la configuración.

## Instalar pygments

Instalar pygments en windows: [pygments](https://tex.stackexchange.com/questions/369600/how-to-install-pygments-on-windows-7).

Para instalar pygments en sistemas unix mirar [Makefile](Makefile).

## Instalar cm-super

Instalar el paquete cm-super con el [administrador grafico de MikTex](https://tex.stackexchange.com/questions/88368/how-do-i-invoke-cm-super) y refrescar las fuentes.

En sistemas GNU/Linux:

```
sudo apt-get install cm-super
```

Finalmente, puedes importar la configuración para compilar el documento en TeXStudio usando el archivo correspondiente para sistemas UNIX o Windows que se encuentra en la carpera **TeXStudio-profile**, menú **Options -> Load profile ...**

Realizado con TexLive 2019
