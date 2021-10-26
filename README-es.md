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

## Bibliografías en diferentes formas

Se ha implementado la posibilidad de obtener las bibliografías usadas en una nueva sección al final de cada capítulo o en usando el estilo por defecto añadiendo subsecciones.

Los proyectos relativos a las bibliografías se encuentran [aquí](bibliography-work-report)

# Realizado con [TexLive 2019](mirror-install-latex-2019-dist.md)

# Citación BibTeX

Si vas a usar este software, por favor incluye una entrada de BibTeX en tu documento para hacer referencia a este proyecto:

```
@Misc{SergioTemplateLatex2021,
	author       = {Martínez-Losa Del Rincón, Sergio},
	howpublished = {\url{https://github.com/sergiomtzlosa/latex-template-report-unizar}},
	title        = {{U}nofficial {L}a{T}e{X} template for reports/books/thesis with corporate logos of {U}niversidad de {Z}aragoza with a beautiful look and feel},
	year         = {2021},
	commit       = {ef0242edd8260c39179310fe1b3bc55c9f69d230},
	journal      = {GitHub repository},
	publisher    = {GitHub},
}
```
