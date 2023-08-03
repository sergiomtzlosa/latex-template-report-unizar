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

Configura BiBTex con el siguiente comando:

```
bibtex ?a*.aux
```

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

## Compresión de PDF con Docker

El comando **make all-cover** del archivo Makefile usa Docker para comprimir el archivo pdf, si desea usar este comando debes instalar Docker](https://www.docker.com/products/docker-desktop).

## Bibliografías en diferentes formas

Se ha implementado la posibilidad de obtener las bibliografías usadas en una nueva sección al final de cada capítulo o en usando el estilo por defecto añadiendo subsecciones.

Los proyectos relativos a las bibliografías se encuentran [aquí](bibliography-work-report)

## Magic comments

Si pones este comando en sistemas Unix al principio del archivo **report.tex**:

```
% !TeX TS-program = make all
```

TexStudio llamara al comando **make all** del archivo Makefile.

## Realizado con TeXLive 2019

Compatible con las últimas versiones de TexLive.

~~Si deseas usar esta plantilla debes tener instalado en tu oredenador TeXLive 2019. Puedes obtener usando los siguientes enlaces para [windows](install-texlive2019-windows.md), [GNU/Linux](install-texlive2019-linux.md) y [Mac](install-texlive2019-mac.md).~~

## Disponible en Overleaf

Plantilla disponible en [Overleaf](https://overleaf.com/latex/templates/latex-phd-template-unizar/cfgtthjfynrx).

# Citación BibTeX

Si vas a usar este software, por favor incluye una entrada de BibTeX en tu documento para hacer referencia a este proyecto:

```
@misc{SergioTemplateLatex2021,
	title        = {{U}nofficial {L}a{T}e{X} template for reports/books/thesis with corporate logos of {U}niversidad de {Z}aragoza with a beautiful look and feel},
	author       = {Martínez-Losa Del Rincón, Sergio},
	year         = 2021,
	journal      = {GitHub repository},
	publisher    = {GitHub},
	howpublished = {\url{https://github.com/sergiomtzlosa/latex-template-report-unizar}},
	commit       = {ef0242edd8260c39179310fe1b3bc55c9f69d230}
}
```
